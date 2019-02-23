####################
# 店舗コントローラー
####################
class ShopsController < ApplicationController
  # 店舗一覧取得
  def index
    @shops = Shop.all.order(created_at: :desc)
  end

  # 店舗詳細取得
  def show
    @shop = Shop.find_by(id: params[:id])
  end

  # 店舗登録フォーム
  def new
    @shop = Shop.new
  end

  # 店舗登録
  def create
    @shop = Shop.new(name: params[:name])
    if @shop.save
      flash[:notice] = "店舗を登録しました"
      redirect_to("/shops")
    else
      render("shops/new")
    end
  end

  # 店舗編集フォーム
  def edit
    @shop = Shop.find_by(id: params[:id])
  end

  # 店舗編集
  def update
    @shop = Shop.find_by(id: params[:id])
    @shop.name = params[:name]
    @shop.save

    if @shop.save
      flash[:notice] = "店舗データを更新しました"
      redirect_to("/shops")
    else
      render("shops/edit")
    end
  end

  # 店舗削除
  def destroy
    @shop = Shop.find_by(id: params[:id])
    @shop.destroy
    flash[:notice] = "店舗を削除しました"
    redirect_to("/shops")
  end
end
