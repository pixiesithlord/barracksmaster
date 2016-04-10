desc "This task is called by the Heroku scheduler add-on"

task :reset_ladder => :environment do
  Player.update_all(points: 0)
end