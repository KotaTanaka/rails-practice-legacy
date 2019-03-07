class CreateServices < ActiveRecord::Migration[5.2]
  def change
    create_table :services, id: false do |t|
      t.string :id, limit: 32, primary_key: true, null: false
      t.string :wifi_name
      t.string :link
      t.timestamps
    end
  end
end
