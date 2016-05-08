desc "This task is called by the Heroku scheduler add-on"

task :recalculate_scores => :environment do
  Player.update_all(points: 0)
  Match.where("created_at > ?", DateTime.now.beginning_of_month).each do |m|
    m.map_payload(m.payload)
  end
end

task :reset_ladder => :environment do
  if Date.today == Date.today.beginning_of_month
    puts "Resetting points"
    LeaderboardEntry.create(players: Player.get_top_10, period: Date.today.strftime("%B %Y"))
    Player.update_all(points: 0)
    puts "done"
  end
end