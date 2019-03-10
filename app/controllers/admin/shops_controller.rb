####################
# 管理API 店舗コントローラー
####################
class Admin::ShopsController < Admin::ApplicationController
  # 店舗一覧取得
  # GET /admin/shops
  def index
    @shops = Shop.all.order(created_at: :desc)
    render("shops/index")
  end

  # 店舗詳細取得
  # GET /admin/shops/:id
  def show
    @shop = Shop.find_by(id: params[:id])
    render("shops/show")
  end

  # 店舗登録フォーム
  # GET /admin/shops/new
  def new
    @shop = Shop.new
    render("shops/new")
  end

  # 店舗登録
  # POST /admin/shops
  def create
    @shop = Shop.new(shop_name: params[:shop_name])
    if @shop.save
      flash[:notice] = "店舗を登録しました"
      redirect_to("/admin/shops")
    else
      render("shops/new")
    end
  end

  # 店舗編集フォーム
  # GET /admin/shops/:id/edit
  def edit
    @shop = Shop.find_by(id: params[:id])
    render("shops/edit")
  end

  # 店舗編集
  # PUT /admin/shops/:id
  def update
    @shop = Shop.find_by(id: params[:id])
    # TODO 店舗情報更新処理

    if @shop.save
      flash[:notice] = "店舗データを更新しました"
      redirect_to("/admin/shops")
    else
      render("shops/edit")
    end
  end

  # 店舗削除
  # DELETE /admin/shops/:id
  def destroy
    @shop = Shop.find_by(id: params[:id])
    @shop.destroy
    flash[:notice] = "店舗を削除しました"
    redirect_to("/admin/shops")
  end
end
