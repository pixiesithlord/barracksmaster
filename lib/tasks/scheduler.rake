desc "This task is called by the Heroku scheduler add-on"

task :reset_ladder => :environment do
  if Date.today == Date.today.beginning_of_month
    puts "Resetting points"
    LeaderboardEntry.create(players: Player.get_top_10, period: Date.today.strftime("%B %Y"))
    Player.update_all(points: 0)
    puts "done"
  end
end