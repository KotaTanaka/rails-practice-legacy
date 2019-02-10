# 店舗コントローラー
class ShopsController < ApplicationController
  # 店舗一覧取得(API/管理画面)
  def index
    @shops = Shop.all.order(created_at: :desc)
  end

  # 店舗詳細取得(API/管理画面)
  def show
    @shop = Shop.find_by(id: params[:id])
  end

  # 店舗登録(管理画面)
  def new
  end

  # 店舗登録(API)
  def create
    @shop = Shop.new(name: params[:name])
    @shop.save
    redirect_to("/shops")
  end

  # 店舗編集(管理画面)
  def edit
    @shop = Shop.find_by(id: params[:id])
  end

  # 店舗編集(API)
  def update
    @shop = Shop.find_by(id: params[:id])
    @shop.name = params[:name]
    @shop.save
    redirect_to("/shops")
  end

  # 店舗削除(API)
  def destroy
    @shop = Shop.find_by(id: params[:id])
    @shop.destroy
    redirect_to("/shops")
  end
end
