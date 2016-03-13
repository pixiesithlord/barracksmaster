class AddPayloadToMatches < ActiveRecord::Migration
  def change
    add_column :matches, :payload, :json
    rename_column :matches, :game_id, :match_id
  end
end
