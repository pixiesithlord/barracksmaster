class Match < ActiveRecord::Base
  
  default_scope { order(created_at: :desc) }
  
  def map_payload payload
    self.payload    = payload
    self.match_id   = payload['dotaMatchID']
    self.game_time  = payload['duration']
    player_id_array = []

    self.payload['players'].each do |player_data|
      steamID_64_bit_id = Player.steamID_from_32_to_64(player_data['steamID32']).to_s
      
      if player_data['pt'].to_i > 0
        player = Player.find_or_create_by(steamID: steamID_64_bit_id)
        calculated = player.points.to_i + player_data['pt'].to_i
        points = (calculated) == nil ? 0 : calculated
        player.update(points: calculated, match_count: player.match_count + 1)
      end

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

      self.payload['players'].each do |player_data|
        steamID_64_bit_id = Player.steamID_from_32_to_64(player_data['steamID32']).to_s
        p                 = Player.find_or_create_by(steamID: steamID_64_bit_id)

        if player_data['team']
          if player_data['team'] == 2
            p && radiant << p
          else
            p && dire << p
          end
        else
          if (player_data['ph'] == "sven") || (player_data['ph'] == "templar_assassin")
            p && radiant << p
          else
            p && dire << p
          end
        end
      end
      
      self.update_attributes(player_data: {'radiant': radiant, 'dire': dire})
      player_data

    end
  end
end
