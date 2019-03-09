class ChangeColumnToShops < ActiveRecord::Migration[5.2]
  def change
    change_column :shops, :ssid, :string, null: false
    change_column :shops, :shop_name, :string, null: false
    change_column :shops, :address, :string, null: false
  end
end
