class AddServiceIdToShops < ActiveRecord::Migration[5.2]
  def change
    add_reference :shops, :service, foreign_key: true, type: :string, limit: 32
  end
end
