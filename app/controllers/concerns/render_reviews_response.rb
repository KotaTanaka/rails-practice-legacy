####################
# レビュー参照系APIレスポンス生成モジュール
####################
module RenderReviewsResponse
  extend ActiveSupport::Concern

  # レビュー一覧取得レスポンス
  def render_review_list(total, reviews)
    review_list = Array.new
    
    reviews.each do |r|
      review = {
        review_id: r.id,
        comment: r.comment,
        publish_status: r.publish_status,
        evaluation: r.evaluation,
        post_date: r.created_at
      }

      review_list.push(review)
    end

    render json: { total: total, review_list: review_list }
  end
end