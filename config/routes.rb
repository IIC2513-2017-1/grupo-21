Rails.application.routes.draw do
  resources :users, only: [:new, :create, :destroy, :edit, :update, :show]
  resources :teams
  resources :tournaments do
    resources :matches
  end
  resources :players
  resource :session, only: [:new, :create, :destroy]
  root 'tournaments#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
