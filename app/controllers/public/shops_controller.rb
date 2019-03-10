####################
# 公開API 店舗コントローラー
####################
class Public::ShopsController < Public::ApplicationController
  # 店舗一覧取得
  # GET /shops
  def index
    @shops = Shop.all.order(created_at: :desc)
    render json: @shops
  end

  # 店舗詳細取得
  # GET /shops:id
  def show
    @shop = Shop.find_by(id: params[:id])
    render json: @shop
  end
end
