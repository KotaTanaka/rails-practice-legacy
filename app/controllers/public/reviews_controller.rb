####################
# 公開API レビューコントローラー
# @author tanakakota
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
    review = Review.new(review_params)
    Shop.find_by!(id: review.shop_id)
    review.publish_status = true

    if review.save
      render_success(:review, :create, review.id)
    else
      render_validation_error(review.errors.full_messages)
    end
  end

  private
    # レビュー投稿リクエストパラメータ
    def review_params
      params.require(:review).permit(:comment, :evaluation, :shop_id)
    end
end
