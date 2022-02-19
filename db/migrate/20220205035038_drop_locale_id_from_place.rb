class DropLocaleIdFromPlace < ActiveRecord::Migration[6.1]
  def change
    remove_column :places, :destination_id
    remove_foreign_key :guides, :destinations
    add_foreign_key :guides, :places, column: :destination_id
    drop_table :destinations
  end
end
