class AddColumnToReview < ActiveRecord::Migration[5.2]
  def change
    add_column :reviews, :review_id, :string
    add_column :reviews, :shop_id, :string
    add_column :reviews, :publish_status, :boolean
    add_column :reviews, :evaluation, :tinyint
  end
end
