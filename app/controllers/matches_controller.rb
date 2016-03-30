class MatchesController < ApplicationController
  def index
    @matches = Match.limit(200)
  end

  def create
    payload = JSON.parse(params['payload'])

    render nothing: true if payload['players'].count == 1

    match_id = payload['dotaMatchID']

    Match.new.map_payload(payload) unless Match.find_by(match_id: match_id)

    render nothing: true
  end
end