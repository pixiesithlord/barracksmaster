class AddSteamDataToPlayer < ActiveRecord::Migration
  def change
    add_column :players, :steam_data, :json
  end
end
