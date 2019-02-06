# レビューコントローラー
class ReviewsController < ApplicationController
  # レビュー一覧取得
  def index
    @reviews = Review.all
  end
end
