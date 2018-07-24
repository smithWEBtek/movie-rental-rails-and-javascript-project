Rails.application.routes.draw do
  root 'application#home'
  resources :famous_quotes
  resources :rentals
  resources :movies
  resources :customers

  resources :customers, only: [:show] do
    resources :rentals, only: [:index]
  end


  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/auth/facebook/callback' => 'sessions#create'

  get '/logout' => 'sessions#destroy'

  get '/signup' => 'customers#new'
  post '/signup' => 'customers#create'

end
