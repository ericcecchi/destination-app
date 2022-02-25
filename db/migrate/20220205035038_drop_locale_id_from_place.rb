class DropLocaleIdFromPlace < ActiveRecord::Migration[6.1]
  def change
    begin
      remove_column :places, :destination_id
      remove_foreign_key :guides, :destinations
      add_foreign_key :guides, :places, column: :destination_id
      drop_table :destinations
    rescue PG::Error
      remove_column :places, :locale_id
      remove_foreign_key :guides, :locales
      add_foreign_key :guides, :places, column: :locale_id
      drop_table :locales
    end
  end
end
