class CreateServices < ActiveRecord::Migration[5.2]
  def change
    create_table :services do |t|
      t.string :wifi_id
      t.string :wifi_name
      t.string :link

      t.timestamps
    end
  end
end
