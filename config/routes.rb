Rails.application.routes.draw do
  resources :users
  resources :teams
  resources :tournaments
  resources :matches
  resources :players
  root 'users#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
