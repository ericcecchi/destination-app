class UpdatePlaceColumns < ActiveRecord::Migration[6.1]
  def change
    remove_column :places, :place_id
    add_column :places, :external_place_id, :string
    change_column_null :places, :locale_id, false
  end
end
