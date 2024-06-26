####################
# 管理API 店舗コントローラー
# @author tanakakota
####################
class Admin::ShopsController < Admin::ApplicationController
  include ValidateCondition
  include AggregateData
  include RenderShopsResponse

  # 店舗一覧取得
  # GET /admin/shops
  # GET /admin/shops.html
  def index
    if params[:wifi_id].nil? then
      shops = Shop.all
    else
      shops = Shop.where(service_id: params[:wifi_id])
    end
    
    @shops_count = shops.count
    @shops_result = shops
      .limit(validate_limit(params[:limit]))
      .offset(validate_offset(params[:offset]))
      .order(created_at: validate_sort(params[:sort]))
    
    # 店舗が紐付くWi-Fiサービスの取得
    ids = Array.new
    @services = Array.new
    @shops_result.each do |shop|
      next if ids.include?(shop.service_id)
      service = Service.find(shop.service_id)
      @services.push(service)
      break if params[:wifi_id].present?
      ids.push(shop.service_id)
    end

    # 店舗に紐付くレビューの集計
    @aggregate_review_map = Hash.new
    @shops_result.each do |shop|
      @aggregate_review_map.store(shop.id, aggregate_review(shop.id))
    end

    respond_to do |format|
      format.json { render_shop_list(@shops_count, @shops_result, @services, @aggregate_review_map) }
      format.html { render("shops/index") }
    end
  end

  # 店舗詳細取得
  # GET /admin/shops/:id
  # GET /admin/shops/:id.html
  def show
    @shop = Shop.find_by!(id: params[:id])
    @service = Service.find_by!(id: @shop.service_id)
    @aggregate_review = aggregate_review(@shop.id)

    respond_to do |format|
      format.json { render_shop_detail(@shop, @service, @aggregate_review) }
      format.html { render("shops/show") }
    end
  end

  # 店舗登録フォーム
  # GET /admin/shops/new.html
  def new
    respond_to do |format|
      format.json
      format.html {
        @shop = Shop.new
        render("shops/new")
      }
    end
  end

  # 店舗登録
  # POST /admin/shops
  # POST /admin/shops.html
  def create
    @shop = Shop.new(shop_params)
    Service.find_by!(id: @shop.service_id)

    respond_to do |format|
      if @shop.save
        format.json { render_success(:shop, :create, @shop.id) }
        format.html {
          flash[:notice] = "店舗を登録しました"
          redirect_to("/admin/shops.html")
        }
      else
        format.json { render_validation_error(@shop.errors.full_messages) }
        format.html { render("shops/new") }
      end
    end
  end

  # 店舗編集フォーム
  # GET /admin/shops/:id/edit.html
  def edit
    respond_to do |format|
      format.json
      format.html {
        @shop = Shop.find_by!(id: params[:id])
        render("shops/edit")
      }
    end
  end

  # 店舗編集
  # PUT /admin/shops/:id
  # PUT /admin/shops/:id.html
  def update
    @shop = Shop.find_by!(id: params[:id])
    Service.find_by!(id: @shop.service_id)

    respond_to do |format|
      if @shop.update(shop_params)
        format.json { render_success(:shop, :update, @shop.id) }
        format.html {
          flash[:notice] = "店舗データを更新しました"
          redirect_to("/admin/shops.html")
        }
      else
        format.json { render_validation_error(@shop.errors.full_messages) }
        format.html { render("shops/edit") }
      end
    end
  end

  # 店舗削除
  # DELETE /admin/shops/:id
  # DELETE /admin/shops/:id.html
  def destroy
    @shop = Shop.find_by!(id: params[:id])
    @shop.destroy

    respond_to do |format|
      format.json { render_success(:shop, :delete, @shop.id) }
      format.html {
        flash[:notice] = "店舗データを削除しました"
        redirect_to("/admin/shops.html")
      }
    end
  end

  private
    # 店舗登録/編集リクエストパラメータ
    def shop_params
      params.require(:shop)
        .permit(:ssid, :shop_name, :address, :service_id, :access, :shop_type, :opening_hours, :seats_num, :power, :description)
    end
end
