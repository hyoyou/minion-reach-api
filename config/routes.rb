Rails.application.routes.draw do
  namespace :api do
    get '/words', to: 'words#index'
    get '/words/easy', to: 'words#easy'
    get '/words/normal', to: 'words#normal'
    get '/words/hard', to: 'words#hard'
    get '/words/bananas', to: 'words#bananas'
    # get '/words/difficulty', to: 'words#difficulty'

    post '/signup', to: 'users#signup'
    get '/users/leaderboard', to: 'users#leaderboard'
    get '/users/:id', to: 'users#show'
    post '/login', to: 'sessions#login'
    post '/find', to: 'sessions#find'
  end

end
