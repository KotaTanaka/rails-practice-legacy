class CreateReviews < ActiveRecord::Migration[5.2]
  def change
    create_table :reviews, id: false do |t|
      t.string :id, limit: 32, primary_key: true, null: false
      t.string :comment
      t.boolean :publish_status
      t.integer :evaluation, limit: 1
      t.timestamps
    end
  end
end
