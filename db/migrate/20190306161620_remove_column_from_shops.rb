class RemoveColumnFromShops < ActiveRecord::Migration[5.2]
  def change
    remove_column :shops, :name, :string
  end
end
