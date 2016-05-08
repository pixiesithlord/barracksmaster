class WelcomeController < ApplicationController
  if Rails.env == 'production'
    caches_action :index, expires_in: 30.minutes
    caches_action :top_10, expires_in: 10.minutes
  end

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
    render json: Player.get_top_10
  end
end