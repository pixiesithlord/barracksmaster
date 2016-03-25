class ChangeSteamIDtoStringForPlayer < ActiveRecord::Migration
  def change
    remove_column :players, :steamID, :integer
    add_column :players, :steamID, :string
  end
end
