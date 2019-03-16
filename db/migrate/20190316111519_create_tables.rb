class CreateTables < ActiveRecord::Migration[5.2]
  def change
    create_table :services, id: false do |t|
      t.string :id, limit: 32, primary_key: true, null: false
      t.string :wifi_name, null: false
      t.string :link
      t.timestamps
    end

    create_table :shops, id: false do |t|
      t.string :id, limit: 36, primary_key: true, null: false
      t.string :ssid, null: false
      t.string :shop_name, null: false
      t.string :address, null: false
      t.string :access
      t.string :shop_type
      t.string :opening_hours
      t.integer :seats_num
      t.boolean :power
      t.text :description
      t.timestamps
    end

    create_table :reviews, id: false do |t|
      t.string :id, limit: 32, primary_key: true, null: false
      t.text :comment, null: false
      t.boolean :publish_status, null: false
      t.integer :evaluation, limit: 1, null: false
      t.timestamps
    end

    add_reference :shops, :service, foreign_key: true, type: :string, limit: 32, null: false
    add_reference :reviews, :shop, foreign_key: true, type: :string, limit: 36, null: false
  end
end
