####################
# レビューコントローラー
####################
class ReviewsController < ApplicationController
  # レビュー一覧取得
  def index
    @reviews = Review.all.order(created_at: :desc)
  end

  # レビュー投稿
  def create
    @review = Review.new(content: params[:content])

    if @review.save
      flash[:notice] = "レビューを投稿しました"
      redirect_to("/reviews")
    else
      render("reviews/new")
    end
  end

  # レビューステータス変更
  def update
    redirect_to("/reviews")
  end

  # レビュー削除
  def destroy
    @review = Review.find_by(id: params[:id])
    @review.destroy
    flash[:notice] = "レビューを削除しました"
    redirect_to("/reviews")
  end
end
