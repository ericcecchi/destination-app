# frozen_string_literal: true

class CreateLocales < ActiveRecord::Migration[6.1]
  def change
    create_table :destinations do |t|
      t.string :name
      t.string :content
      t.string :image_url

      t.timestamps
    end
  end
end
