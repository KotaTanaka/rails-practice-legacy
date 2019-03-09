class ChangeColumnToReviews < ActiveRecord::Migration[5.2]
  def change
    change_column :reviews, :comment, :text, null: false
    change_column :reviews, :evaluation, :integer, limit: 1, null: false
    change_column :reviews, :publish_status, :boolean, null: false
  end
end
