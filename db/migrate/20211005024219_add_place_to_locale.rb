class AddPlaceToLocale < ActiveRecord::Migration[6.1]
  def change
    add_reference :destinations, :place, null: false, foreign_key: true
  end
end
