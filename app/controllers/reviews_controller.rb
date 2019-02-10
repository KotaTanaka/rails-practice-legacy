# レビューコントローラー
class ReviewsController < ApplicationController
  # レビュー一覧取得(API/管理画面)
  def index
    @reviews = Review.all.order(created_at: :desc)
  end

  # レビュー投稿(API)
  def create
    @review = Review.new(content: params[:content])
    @review.save
    redirect_to("/reviews")
  end

  # レビューステータス変更(API)
  def update
    redirect_to("/reviews")
  end

  # レビュー削除(API)
  def destroy
    @review = Review.find_by(id: params[:id])
    @review.destroy
    redirect_to("/reviews")
  end
end
