####################
# 管理API Wi-Fiサービスコントローラー
####################
class Admin::ServicesController < Admin::ApplicationController
  # Wi-Fiサービス一覧取得
  # GET /admin/services
  def index
    @services = Service.all.order(created_at: :desc)

    respond_to do |format|
      format.html { render("services/index") }
      format.json { render json: @services }
    end
  end

  # Wi-Fiサービス詳細取得
  # GET /admin/services/:id
  def show
    @service = Service.find_by(id: params[:id])

    respond_to do |format|
      format.html { render("services/show") }
      format.json { render json: @service }
    end
  end

  # Wi-Fiサービス登録フォーム
  # GET /admin/services/new
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
  # GET /admin/services/:id/edit
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
  def update
    @service = Service.find_by(id: params[:id])
    # TODO Wi-Fiサービス情報更新処理

    respond_to do |format|
      if @service.save
        format.json
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
  def destroy
    @service = Service.find_by(id: params[:id])
    @service.destroy

    respond_to do |format|
      format.json
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
