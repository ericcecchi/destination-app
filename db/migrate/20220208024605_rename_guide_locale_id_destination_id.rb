class RenameGuideLocaleIdDestinationId < ActiveRecord::Migration[6.1]
  def change
    rename_column :guides, :locale_id, :destination_id
  end
end
