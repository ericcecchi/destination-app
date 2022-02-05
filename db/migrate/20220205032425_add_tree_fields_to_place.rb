class AddTreeFieldsToPlace < ActiveRecord::Migration[6.1]
  def change
    add_column :places, :parent_id, :integer
    add_column :places, :image_url, :string
    add_column :places, :type, :string
  end
end
