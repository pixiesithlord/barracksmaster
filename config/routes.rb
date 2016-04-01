Rails.application.routes.draw do

  root 'welcome#index'
  get '/ladder' => 'welcome#index'
  
  #start here
  post '/new_match' => 'matches#create'
  get '/matches' => 'matches#index'
  get '/matches/:id' => 'matches#show'
  get '/players/:id' => 'players#show'
  #ladder
  get '/top_players' => 'players#index'
  get '/changelog' => 'welcome#changelog'

  get '/top_10' => 'welcome#top_10'

  get '/videos' => 'welcome#videos'
  get '/hall_of_fame' => 'welcome#hall_of_fame'
  get '/live_stream' => 'welcome#live_stream'
  get '/forum' => 'welcome#forum'

end
