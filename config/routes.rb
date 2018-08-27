Rails.application.routes.draw do
  namespace :api do
    resources :words, only: [:index]
  end

  get 'api/words/get' => 'api/words#get'
end
