class ChangeColumnNullOnPlace < ActiveRecord::Migration[6.1]
  def change
    change_column_null :places, :locale_id, true
  end
end
