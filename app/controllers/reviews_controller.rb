# レビューコントローラー
class ReviewsController < ApplicationController
  # レビュー一覧取得
  def index
    @reviews = Review.all.order(created_at: :desc)
  end

  # レビュー投稿画面
  def new
  end

  # レビュー投稿
  def create
    @review = Review.new(content: params[:content])
    @review.save
    redirect_to("/reviews")
  end
end
