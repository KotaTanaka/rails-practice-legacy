####################
# 公開API レビューコントローラー
####################
class Public::ReviewsController < Public::ApplicationController
  # レビュー一覧取得
  # GET /review
  def index
    @reviews = Review.all.order(created_at: :desc)
    render json: @reviews
  end

  # レビュー投稿
  # POST /reviews
  def create
    @review = Review.new(content: params[:content])
    @review.save
  end
end
