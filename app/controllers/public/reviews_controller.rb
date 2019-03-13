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
    review = Review.new(create_review_params)
    review.publish_status = true
    review.save
    render_success(:review, :create, review.id)
  end

  private
    # レビュー投稿リクエストパラメータ
    def create_review_params
      params.require(:review).permit(:comment, :evaluation, :shop_id)
    end
end
