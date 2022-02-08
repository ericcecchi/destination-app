class CreateGuides < ActiveRecord::Migration[6.1]
  def change
    create_table :guides do |t|
      t.string :title
      t.text :description
      t.references :destination, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
