class AddMatchCountToPlayer < ActiveRecord::Migration
  def change
    add_column :players, :match_count, :integer, default: 0
  end
end
