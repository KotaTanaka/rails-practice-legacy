####################
# 管理API Wi-Fiサービスコントローラー
####################
class Admin::ServicesController < Admin::ApplicationController
  # Wi-Fiサービス一覧取得
  # GET /admin/services
  def index
    @services = Service.all.order(created_at: :desc)
    render("services/index")
  end

  # Wi-Fiサービス詳細取得
  # GET /admin/services/:id
  def show
    @service = Service.find_by(id: params[:id])
    render("services/show")
  end

  # Wi-Fiサービス登録フォーム
  # GET /admin/services/new
  def new
    @service = Service.new
    render("services/new")
  end

  # Wi-Fiサービス登録
  # POST /admin/services
  def create
    @service = Service.new(wifi_name: params[:wifi_name])
    if @service.save
      flash[:notice] = "Wi-Fiサービスを登録しました"
      redirect_to("/admin/services")
    else
      render("services/new")
    end
  end

  # Wi-Fiサービス編集フォーム
  # GET /admin/services/:id/edit
  def edit
    @service = Service.find_by(id: params[:id])
    render("services/edit")
  end

  # Wi-Fiサービス編集
  # PUT /admin/services/:id
  def update
    @service = Service.find_by(id: params[:id])
    # TODO Wi-Fiサービス情報更新処理

    if @service.save
      flash[:notice] = "Wi-Fiデータを更新しました"
      redirect_to("/admin/services")
    else
      render("services/edit")
    end
  end

  # Wi-Fiサービス削除
  # DELETE /admin/services/:id
  def destroy
    @service = Service.find_by(id: params[:id])
    @service.destroy
    flash[:notice] = "Wi-Fiサービスを削除しました"
    redirect_to("/admin/services")
  end
end
