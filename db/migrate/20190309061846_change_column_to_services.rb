class ChangeColumnToServices < ActiveRecord::Migration[5.2]
  def change
    change_column :services, :wifi_name, :string, null: false
  end
end
