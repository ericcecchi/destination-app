class AddTitleToRecommendations < ActiveRecord::Migration[6.1]
  def change
    add_column :recommendations, :title, :string
  end
end
