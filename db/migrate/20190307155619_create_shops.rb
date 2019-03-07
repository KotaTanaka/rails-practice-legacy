class CreateShops < ActiveRecord::Migration[5.2]
  def change
    create_table :shops, id: false do |t|
      t.string :id, limit: 36, primary_key: true, null: false
      t.string :ssid
      t.string :shop_name
      t.string :address
      t.string :shop_type
      t.string :opening_houres
      t.integer :seats_num
      t.boolean :power
      t.text :descriotion
      t.timestamps
    end
  end
end
