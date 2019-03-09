class AddShopIdToReviews < ActiveRecord::Migration[5.2]
  def change
    add_reference :reviews, :shop, foreign_key: true, type: :string, limit: 36
  end
end
