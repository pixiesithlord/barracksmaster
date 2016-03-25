class MatchesController < ApplicationController
  def index
    @matches = Match.all
  end

  def create
    payload  = JSON.parse(params['payload'])
    players  = payload['players']

    render nothing: true if players.count == 1

    unless Match.find_by(match_id: match_id)
      m = Match.new(payload: payload)
      # m.map_payload
      m.save
    end

    # players.each do |player_data|
    #   player = Player.find_or_create_by(steamID: player_data["steamID32"])
    #   player.update(points: player.points.to_i + player_data['pt'].to_i)
    # end

    render nothing: true
  end
end