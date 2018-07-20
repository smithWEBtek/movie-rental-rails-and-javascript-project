Rails.application.routes.draw do
  root 'application#home'
  resources :famous_quotes
  resources :rentals
  resources :movies
  resources :customers

  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/auth/facebook/callback' => 'sessions#create'

  get '/logout' => 'sessions#destroy'

  get '/signup' => 'users#new'
  post '/signup' => 'users#create'

end
