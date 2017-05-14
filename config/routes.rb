Rails.application.routes.draw do
  resources :users
  resources :tournaments do
    resources :matches
  end
  get 'tournaments/:tournament_id/matches/:id/finalizar_partido', to: 'matches#finalizar_partido',
      as: 'finalizar_partido'
  patch 'tournaments/:tournament_id/matches/:id/finalizar_partido', to: 'matches#update_finish_match',
      as: 'update_finish_match'
  resources :teams do
    resources :players
  end
  resource :session, only: [:new, :create, :destroy]
  root 'tournaments#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
