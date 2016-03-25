class MatchesController < ApplicationController
  def index
    @matches = Match.all
  end

  def create
    payload  = JSON.parse(params['payload'])
    players = payload['players']
    render nothing: true if players.count == 1
    match_id = payload['dotaMatchID']
    m = Match.new

    unless Match.find_by(match_id: match_id)
      m.payload = payload
      m.map_payload
      m.save
    end

    # m.player_ids.each do |id|
    #   player = Player.find_or_create_by(steamID: id)
    #   player.update(points: player.points.to_i + player_data['pt'].to_i)
    # end

    render nothing: true
  end
end