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
  root 'static_pages#home'
  get 'home', to: 'static_pages#home', as: 'home'
  get 'about', to: 'static_pages#about', as: 'about'
  get 'objetivo', to: 'static_pages#objetivo', as: 'objetivo'
  get 'como_usarlo', to: 'static_pages#como_usarlo', as: 'como_usarlo'
  post 'tournaments/:tournament_id/matches', to: 'matches#generar_partidos', as: 'generar_partidos'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
