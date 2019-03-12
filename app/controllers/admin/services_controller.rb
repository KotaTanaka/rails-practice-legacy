####################
# 管理API Wi-Fiサービスコントローラー
####################
class Admin::ServicesController < Admin::ApplicationController
  include ValidateCondition
  include RenderServicesResponse

  # Wi-Fiサービス一覧取得
  # GET /admin/services
  # GET /admin/services.html
  def index
    @services = Service.all.order(created_at: :desc)
      .limit(validate_limit(params[:limit]))
      .offset(validate_offset(params[:offset]))
      .order(created_at: validate_sort(params[:sort]))

    # Wi-Fiサービスに紐付く店舗数の取得
    @shop_count_map = Hash.new
    @services.each do |service|
      shop_count = Shop.where(service_id: service.id).count
      @shop_count_map.store(service.id, shop_count)
    end

    respond_to do |format|
      format.json { render_service_list(Service.count, @services, @shop_count_map) }
      format.html { render("services/index") }
    end
  end

  # Wi-Fiサービス詳細取得
  # GET /admin/services/:id
  # GET /admin/services/:id.html
  def show
    @service = Service.find_by(id: params[:id])

    respond_to do |format|
      format.html { render("services/show") }
      format.json { render json: @service }
    end
  end

  # Wi-Fiサービス登録フォーム
  # GET /admin/services/new.html
  def new
    respond_to do |format|
      format.json
      format.html {
        @service = Service.new
        render("services/new")
      }
    end
  end

  # Wi-Fiサービス登録
  # POST /admin/services
  # POST /admin/services.html
  def create
    @service = Service.new(service_params)

    respond_to do |format|
      if @service.save
        format.json { render_success(:service, :create, @service.id) }
        format.html {
          flash[:notice] = "Wi-Fiサービスを登録しました"
          redirect_to("/admin/services.html")
        }
      else
        format.json
        format.html render("services/new")
      end
    end
  end

  # Wi-Fiサービス編集フォーム
  # GET /admin/services/:id/edit.html
  def edit
    respond_to do |format|
      format.json
      format.html {
        @service = Service.find_by(id: params[:id])
        render("services/edit")
      }
    end
  end

  # Wi-Fiサービス編集
  # PUT /admin/services/:id
  # PUT /admin/services/:id.html
  def update
    @service = Service.find_by(id: params[:id])

    respond_to do |format|
      if @service.update(service_params)
        format.json { render_success(:service, :update, @service.id) }
        format.html {
          flash[:notice] = "Wi-Fiデータを更新しました"
          redirect_to("/admin/services.html")
        }
      else
        format.json
        format.html render("serivces/edit")
      end
    end
  end

  # Wi-Fiサービス削除
  # DELETE /admin/services/:id
  # DELETE /admin/services/:id.html
  def destroy
    @service = Service.find_by(id: params[:id])
    @service.destroy

    respond_to do |format|
      format.json { render_success(:service, :delete, @service.id) }
      format.html {
        flash[:notice] = "Wi-Fiサービスを削除しました"
        redirect_to("/admin/services.html")
      }
    end
  end

  private
    # Wi-Fiサービス登録/更新リクエストパラメータ
    def service_params
      params.require(:service).permit(:wifi_name, :link)
    end
end
