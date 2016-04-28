class ChangePointsDefault < ActiveRecord::Migration
  def change
    change_column_default :players, :points, 0
  end
end
