class Match < ActiveRecord::Base
  # Payload
  # lm = lumber, 
  # nw = net worth, 
  # gl = gold, 
  # cs = creep score/creep kills, 
  # pt = no. of points earned (this is the key one), 
  # ph = i think this is the hero? should be la huh, 
  # steam id = the steam no. to identify the exact player 
  # matchID = the identifying no. for that match played
  
  default_scope { order(created_at: :desc) }
  
end
