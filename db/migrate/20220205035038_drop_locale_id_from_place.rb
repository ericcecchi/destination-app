class DropLocaleIdFromPlace < ActiveRecord::Migration[6.1]
  def change
    remove_column :places, :locale_id
    remove_foreign_key :guides, :destinations
    add_foreign_key :guides, :places, column: :locale_id
    drop_table :destinations
  end
end
