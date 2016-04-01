class WelcomeController < ApplicationController
  def index
  end

  def changelog
  end

  def live_stream
  end

  def videos
  end

  def top_10
    players = []

    Player.limit(10).each_with_index do |p, index|
      players << {rank: index + 1, steamID: p.steamID, username: p.name, points: p.points }
    end

    render json: players
  end
end