class Match < ActiveRecord::Base
  
  default_scope { order(created_at: :desc) }
  
  def map_payload
    self.match_id   = payload['dotaMatchID']
    self.game_time  = payload['duration']
    # self.player_ids = 
    #   payload['players'].map do |player_data|
    #     Player.steamID_from_32_to_64(player_data['steamID32'])
    #   end
  end
end
