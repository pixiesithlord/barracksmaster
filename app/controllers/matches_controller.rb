class MatchesController < ApplicationController
  http_basic_authenticate_with name: "myron", password: "myron", only: :index_admin

  if Rails.env == 'production'
    caches_action :index, expires_in: 10.minutes
  end

  def index
    @matches = Match.limit(100)
  end

  def index_admin
    @matches = Match.limit(200)
  end

  def create
    payload = JSON.parse(params['payload'])

    unless payload['players'].count == 1

      match_id = payload['dotaMatchID']

      Match.new.map_payload(payload) unless Match.find_by(match_id: match_id)
      
    end

    render nothing: true
  end
end