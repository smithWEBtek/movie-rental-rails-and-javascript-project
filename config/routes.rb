Rails.application.routes.draw do
  root 'application#home'
  resources :famous_quotes
  resources :rentals
  resources :movies
  resources :customers
  get '/auth/facebook/callback' => 'sessions#facebook_create'

end
