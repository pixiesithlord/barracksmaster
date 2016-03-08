class MatchesController < ApplicationController
  def index
  end

  def create
    puts params if params
    redirect_to root_path
  end
end