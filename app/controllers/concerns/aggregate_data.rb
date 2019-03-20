####################
# 集計モジュール
# @author tanakakota
####################
module AggregateData
  extend ActiveSupport::Concern

  # 店舗に紐付くレビューの集計
  def aggregate_review(shop_id)
    reviews = Review.where(shop_id: shop_id).where(publish_status: true)
    aggregate_review = {
      review_count: reviews.count,
      evaluation_average: reviews.average(:evaluation).to_f.round(1)
    }
  end
end