class AddImageToGuides < ActiveRecord::Migration[6.1]
  def change
    add_column :guides, :image_url, :string
  end
end
