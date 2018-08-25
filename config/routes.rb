Rails.application.routes.draw do
  namespace :api do
    resources :words
  end
end
