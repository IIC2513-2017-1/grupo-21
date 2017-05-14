Rails.application.routes.draw do
  resources :users
  resources :tournaments do
    resources :matches
  end
  resources :teams do
    resources :players
  end
  resource :session, only: [:new, :create, :destroy]
  root 'tournaments#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
