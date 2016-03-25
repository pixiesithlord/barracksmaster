class ChangeSteamIDtoStringForPlayer < ActiveRecord::Migration
  def up
    change_column :players, :steamID, :integer
  end

  def down
    change_column :players, :steamID, :string
  end
end
