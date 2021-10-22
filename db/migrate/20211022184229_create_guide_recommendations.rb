class CreateGuideRecommendations < ActiveRecord::Migration[6.1]
  def change
    create_table :guide_recommendations do |t|
      t.references :guide, null: false, foreign_key: true
      t.references :recommendation, null: false, foreign_key: true

      t.timestamps
    end
  end
end
