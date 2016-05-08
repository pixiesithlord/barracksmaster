class LeaderboardEntry < ActiveRecord::Base

  def new(attributes={})
    super
    p 'lol'
    @players ||= Player.get_top_10.to_json
    return self
  end

end
