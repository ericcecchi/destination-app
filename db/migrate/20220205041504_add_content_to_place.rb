class AddContentToPlace < ActiveRecord::Migration[6.1]
  def change
    add_column :places, :content, :text
  end
end
