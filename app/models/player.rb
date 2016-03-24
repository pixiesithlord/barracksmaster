class Player < ActiveRecord::Base
  default_scope {order(points: :desc)}
end
