####################
# 管理API 店舗コントローラー
####################
class Admin::ShopsController < Admin::ApplicationController
  # 店舗一覧取得
  # GET /admin/shops
  def index
    @shops = Shop.all.order(created_at: :desc)

    respond_to do |format|
      format.json { render json: @shops }
      format.html { render("shops/index") }
    end
  end

  # 店舗詳細取得
  # GET /admin/shops/:id
  def show
    @shop = Shop.find_by(id: params[:id])

    respond_to do |format|
      format.json { render json: @shop }
      format.html { render("shops/show") }
    end
  end

  # 店舗登録フォーム
  # GET /admin/shops/new
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
  def create
    @shop = Shop.new(shop_name: params[:shop_name])

    respond_to do |format|
      if @shop.save
        format.json
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
  # GET /admin/shops/:id/edit
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
  def update
    @shop = Shop.find_by(id: params[:id])
    # TODO 店舗情報更新処理

    respond_to do |format|
      if @shop.save
        format.json
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
  def destroy
    @shop = Shop.find_by(id: params[:id])
    @shop.destroy

    respond_to do |format|
      format.json
      format.html {
        flash[:notice] = "店舗データを更新しました"
        redirect_to("/admin/shops.html")
      }
    end
  end
end
