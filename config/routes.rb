Rails.application.routes.draw do
  root 'application#home'
  resources :famous_quotes
  resources :rentals
  resources :movies
  resources :customers
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
