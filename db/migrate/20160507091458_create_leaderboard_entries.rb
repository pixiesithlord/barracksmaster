class CreateLeaderboardEntries < ActiveRecord::Migration
  def change
    create_table :leaderboard_entries do |t|
      t.json :players
      t.date :period

      t.timestamps null: false
    end
  end
end
