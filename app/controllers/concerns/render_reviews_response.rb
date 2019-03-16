####################
# レビュー参照系APIレスポンス生成モジュール
# @author tanakakota
####################
module RenderReviewsResponse
  extend ActiveSupport::Concern

  # レビュー一覧生成
  def render_review_list(total, reviews, shops)
    review_list = Array.new
    
    reviews.each do |r|
      shop_name = ""

      # 店舗名の取得
      shops.each do |s|
        if s[:id] == r.shop_id
          shop_name = s[:shop_name]
          break
        end
      end

      review = {
        shop_id: r.shop_id,
        shop_name: shop_name,
        review_id: r.id,
        comment: r.comment,
        publish_status: r.publish_status,
        evaluation: r.evaluation,
        post_date: r.created_at,
        status_updated_date: r.updated_at
      }

      review_list.push(review)
    end

    render json: { total: total, review_list: review_list }
  end

  # 店舗に紐付くレビュー一覧生成
  def render_shop_review_list(total, reviews)
    review_list = Array.new
    
    reviews.each do |r|
      review = {
        review_id: r.id,
        comment: r.comment,
        evaluation: r.evaluation,
        post_date: r.created_at
      }

      review_list.push(review)
    end

    render json: { total: total, review_list: review_list }
  end
end