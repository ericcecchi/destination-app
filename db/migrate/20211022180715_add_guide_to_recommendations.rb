class AddGuideToRecommendations < ActiveRecord::Migration[6.1]
  def change
    add_reference :recommendations, :guide, null: false, foreign_key: true
  end
end
