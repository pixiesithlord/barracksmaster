class AddPlayerDataToMatch < ActiveRecord::Migration
  def change
    add_column :matches, :player_data, :json
  end
end
