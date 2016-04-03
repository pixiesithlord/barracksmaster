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

  def winning_side
    payload['winner'] == 2 ? 'Radiant' : 'Dire'
  end

  def players
    if self.player_data
      player_data

    else

      radiant = []
      dire    = []

      offset = player_ids.count/2

      player_ids.each_with_index do |id, index|
        p = Player.find_by(steamID: id)
        if index < (player_ids.count - offset)
          radiant << p
        else
          dire << p
        end
      end
      
      self.update_attributes(player_data: {'radiant': radiant, 'dire': dire})

    end
  end
end
