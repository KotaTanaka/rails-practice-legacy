class AddColumnToShops < ActiveRecord::Migration[5.2]
  def change
    add_column :shops, :shop_id, :string
    add_column :shops, :wifi_id, :string
    add_column :shops, :ssid, :string
    add_column :shops, :shop_name, :string
    add_column :shops, :address, :string
    add_column :shops, :shop_type, :string
    add_column :shops, :opening_houres, :string
    add_column :shops, :seats_num, :integer
    add_column :shops, :power, :boolean
    add_column :shops, :description, :text
  end
end
