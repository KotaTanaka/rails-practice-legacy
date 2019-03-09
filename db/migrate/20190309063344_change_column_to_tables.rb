class ChangeColumnToTables < ActiveRecord::Migration[5.2]
  def change
    change_column :shops, :service_id, :string, limit: 32, null: false
    change_column :reviews, :shop_id, :string, limit: 36, null: false
  end
end
