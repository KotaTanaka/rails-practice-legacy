class DeleteServices < ActiveRecord::Migration[5.2]
  def change
    drop_table :services
  end
end
