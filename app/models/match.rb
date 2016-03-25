class Match < ActiveRecord::Base
  
  default_scope { order(created_at: :desc) }
  
  def map_payload
    self.match_id          = payload['dotaMatchID']
    self.game_time         = payload['duration']
    self.connection_status = payload['con']
  end
end
