class ChangeGameTimeToFloat < ActiveRecord::Migration
  def change
    remove_column :matches, :game_time, :string
    add_column :matches, :game_time, :integer
  end
end
