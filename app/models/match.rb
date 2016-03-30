class Match < ActiveRecord::Base
  
  default_scope { order(created_at: :desc) }
  
  def map_payload payload
    self.payload    = payload
    self.match_id   = payload['dotaMatchID']
    self.game_time  = payload['duration']
    player_id_array = []

    self.payload['players'].each do |player_data|
      steamID_64_bit_id = Player.steamID_from_32_to_64(player_data['steamID32']).to_s
      
      player = Player.find_or_create_by(steamID: steamID_64_bit_id)
      player.update(points: player.points.to_i + player_data['pt'].to_i)

      player_id_array << steamID_64_bit_id
    end

    self.player_ids = player_id_array

    self.save

  end
end
