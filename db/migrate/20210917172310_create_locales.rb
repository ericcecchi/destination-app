class CreateLocales < ActiveRecord::Migration[6.1]
  def change
    create_table :locales do |t|
      t.string :name
      t.string :content
      t.string :hero_image_url

      t.timestamps
    end
  end
end
