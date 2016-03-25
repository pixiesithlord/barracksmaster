class ChangeMatchPlayerIdStorage < ActiveRecord::Migration
  def change
    remove_column :matches, :player_ids, :integer, array: true
    remove_column :matches, :scoreboard_info, :string
    add_column :matches, :player_ids, :string, array: true
  end
end
