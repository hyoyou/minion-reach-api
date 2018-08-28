Rails.application.routes.draw do
  namespace :api do
    resources :words, only: [:index]
  end

  get 'api/words/easy' => 'api/words#easy'
  get 'api/words/normal' => 'api/words#normal'
  get 'api/words/hard' => 'api/words#hard'
  get 'api/words/bananas' => 'api/words#bananas'
  # get 'api/words/difficulty' => 'api/words#difficulty'
end
