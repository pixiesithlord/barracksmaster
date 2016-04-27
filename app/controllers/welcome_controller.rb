class WelcomeController < ApplicationController
  # if Rails.env == 'production'
    # caches_action :index, expires_in: 2.hours
    # caches_action :top_10, expires_in: 10.minutes
  # end

  def index
  end

  def changelog
    expires_in 24.hours, public: true
  end

  def live_stream
  end

  def videos
    expires_in 24.hours, public: true
  end

  def top_10
    players = []

    Player.limit(10).each_with_index do |p, index|
      players << {rank: index + 1, steamID: p.steamID, username: p.name, points: p.points }
    end

    render json: players
  end
end