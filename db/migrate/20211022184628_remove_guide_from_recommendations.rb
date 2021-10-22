class RemoveGuideFromRecommendations < ActiveRecord::Migration[6.1]
  def up
    remove_foreign_key :recommendations, :guides
    remove_column :recommendations, :guide_id
  end

  def down; end
end
