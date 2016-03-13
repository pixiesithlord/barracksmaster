class CreatePlayers < ActiveRecord::Migration
  def change
    create_table :players do |t|
      t.integer :steamID
      t.integer :match_ids, array: true
      t.integer :points

      t.timestamps null: false
    end
  end
end
