# frozen_string_literal: true

class CreatePlaces < ActiveRecord::Migration[6.1]
  def change
    create_table :places do |t|
      t.string :place_id
      t.string :name
      t.references :locale, null: false, foreign_key: true

      t.timestamps
    end

    add_reference :recommendations, :place, foreign_key: true
  end
end
