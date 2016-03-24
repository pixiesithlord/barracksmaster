class MatchesController < ApplicationController
  def index
    @matches = Match.all
  end

  def create
    payload  = JSON.parse(params['payload'])
    players  = payload['rounds']['0']['players']
    match_id = payload["matchID"]

    unless Match.find_by(match_id: match_id)
      m = Match.create(
        payload:    payload,
        match_id:   match_id,
        game_time:  payload['rounds']['0']['game']['dr']/60,
        player_ids: players.map { |p| p['steamID32']}
      )
    end

    players.each do |player_data|
      player = Player.find_or_create_by(steamID: player_data["steamID32"])
      player.update(points: player.points.to_i + player_data['pt'].to_i)
    end

    render nothing: true
  end
end