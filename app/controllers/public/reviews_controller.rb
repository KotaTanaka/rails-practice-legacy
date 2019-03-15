####################
# 公開API レビューコントローラー
####################
class Public::ReviewsController < Public::ApplicationController
  include ValidateCondition
  include RenderReviewsResponse

  # レビュー一覧取得
  # GET /review
  def index
    reviews_result = Review
      .where(shop_id: params[:shop_id])
      .where(publish_status: true)
    count = reviews_result.count
    reviews = reviews_result
      .limit(validate_limit(params[:limit]))
      .offset(validate_offset(params[:offset]))
      .order(created_at: validate_sort(params[:sort]))

    render_shop_review_list(count, reviews)
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
