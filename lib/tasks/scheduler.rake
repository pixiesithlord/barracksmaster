desc "This task is called by the Heroku scheduler add-on"

task :reset_ladder => :environment do
  puts "Resetting points"
  Player.update_all(points: 0)
  puts "done"
end