class ChangeMatchesToUseArray < ActiveRecord::Migration
  def change
    remove_column :matches, :player_ids, :integer
    add_column :matches, :player_ids, :integer, array: true
  end
end
