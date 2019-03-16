####################
# 管理API 店舗コントローラー
# @author tanakakota
####################
class Admin::ShopsController < Admin::ApplicationController
  include ValidateCondition
  include RenderShopsResponse

  # 店舗一覧取得
  # GET /admin/shops
  # GET /admin/shops.html
  def index
    @shops = Shop.all
      .limit(validate_limit(params[:limit]))
      .offset(validate_offset(params[:offset]))
      .order(created_at: validate_sort(params[:sort]))
    
    # 店舗が紐付くWi-Fiサービスの取得
    ids = Array.new
    @services = Array.new
    @shops.each do |shop|
      next if ids.include?(shop.service_id)
      service = Service.find(shop.service_id)
      @services.push(service)
      ids.push(shop.service_id)
    end

    # TODO 各店舗のレビュー数の取得
    # TODO 各店舗の評価の平均値の算出
    # review_map (Hash)にして render_shop_list の引数に加える

    respond_to do |format|
      format.json { render_shop_list(Shop.count, @shops, @services) }
      format.html { render("shops/index") }
    end
  end

  # 店舗詳細取得
  # GET /admin/shops/:id
  # GET /admin/shops/:id.html
  def show
    @shop = Shop.find_by(id: params[:id])
    @service = Service.find_by(id: @shop.service_id)

    # TODO 各店舗のレビュー数の取得
    # TODO 各店舗の評価の平均値の算出
    # review (Array)にして render_shop_list の引数に加える

    respond_to do |format|
      format.json { render_shop_detail(@shop, @service) }
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
    @shop = Shop.new(create_shop_params)

    respond_to do |format|
      if @shop.save
        format.json { render_success(:shop, :create, @shop.id) }
        format.html {
          flash[:notice] = "店舗を登録しました"
          redirect_to("/admin/shops.html")
        }
      else
        format.json
        format.html render("shops/new")
      end
    end
  end

  # 店舗編集フォーム
  # GET /admin/shops/:id/edit.html
  def edit
    respond_to do |format|
      format.json
      format.html {
        @shop = Shop.find_by(id: params[:id])
        render("shops/edit")
      }
    end
  end

  # 店舗編集
  # PUT /admin/shops/:id
  # PUT /admin/shops/:id.html
  def update
    @shop = Shop.find_by(id: params[:id])

    respond_to do |format|
      if @shop.update(update_shop_params)
        format.json { render_success(:shop, :update, @shop.id) }
        format.html {
          flash[:notice] = "店舗データを更新しました"
          redirect_to("/admin/shops.html")
        }
      else
        format.json
        format.html render("shops/edit")
      end
    end
  end

  # 店舗削除
  # DELETE /admin/shops/:id
  # DELETE /admin/shops/:id.html
  def destroy
    @shop = Shop.find_by(id: params[:id])
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
    # 店舗登録リクエストパラメータ
    def create_shop_params
      params.require(:shop)
        .permit(:ssid, :shop_name, :address, :service_id, :shop_type, :opening_hours, :seats_num, :power, :description)
    end

    # 店舗編集リクエストパラメータ
    def update_shop_params
      params.require(:shop)
        .permit(:ssid, :shop_type, :opening_hours, :seats_num, :power, :description)
    end
end
