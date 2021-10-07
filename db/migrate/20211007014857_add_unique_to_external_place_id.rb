class AddUniqueToExternalPlaceId < ActiveRecord::Migration[6.1]
  def change
    add_index :places, :external_place_id, unique: true
  end
end
