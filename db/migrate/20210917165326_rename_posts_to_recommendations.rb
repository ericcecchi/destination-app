class RenamePostsToRecommendations < ActiveRecord::Migration[6.1]
  def change
    rename_table :posts, :recommendations
  end
end
