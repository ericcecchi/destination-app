class AddDetailsToPlace < ActiveRecord::Migration[6.1]
  def change
    add_column :places, :details, :jsonb
  end
end
