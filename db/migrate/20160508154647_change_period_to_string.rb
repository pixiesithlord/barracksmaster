class ChangePeriodToString < ActiveRecord::Migration
  def change
    remove_column :leaderboard_entries, :period
    add_column :leaderboard_entries, :period, :string
  end
end
