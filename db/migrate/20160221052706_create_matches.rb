class CreateMatches < ActiveRecord::Migration
  def change
    create_table :matches do |t|
      t.string :game_id
      t.string :player_ids
      t.string :game_time
      t.string :connection_status
      t.string :scoreboard_info

      t.timestamps null: false
    end
  end
end
