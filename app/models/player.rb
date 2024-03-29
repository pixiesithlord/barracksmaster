class Player < ActiveRecord::Base
  default_scope {order(points: :desc)}
  after_create :set_steam_info

  def self.get_top_10
    players = []

    Player.limit(10).each_with_index do |p, index|
      players << {rank: index + 1, steamID: p.steamID, username: p.name, points: p.points }
    end

    players
  end
  
  def self.steamID_from_32_to_64(id)
    ('765' + (id + 61197960265728).to_s).to_i
  end

  def self.steamID_from_64_to_32(id)
    (id.to_s.slice(3, id.to_s.length)).to_i - 61197960265728
  end

  def set_steam_info
    uri  = 'http://api.steampowered.com/ISteamUser/GetPlayerSummaries/v0002/?key=96DD4E3D461672DDA2361EE82C51A7B5&steamids='
    resp = JSON.parse(Net::HTTP.get(URI(uri + steamID.to_s)))
    self.update_attributes(steam_data: resp['response']['players'][0])
  end

  def name
    steam_data['personaname']
  end

  def url
    steam_data['profileurl']
  end

  def photo
    steam_data['avatarfull']
  end

  def country_code
    steam_data['loccountrycode'].try(:downcase)
  end

end
