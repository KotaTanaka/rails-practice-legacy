# 店舗コントローラー
class ShopsController < ApplicationController
  # 店舗一覧取得
  def index
    @shops = Shop.all
  end

  # 店舗詳細取得
  def show
    @shop = Shop.find_by(id: params[:id])
  end
end
