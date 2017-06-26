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
  get 'tournaments/:id/generar_partidos', to: 'tournaments#generar_partidos', as: 'generar_partidos'
  get 'tournaments/:id/terminar_torneo', to: 'tournaments#terminar_torneo', as: 'terminar_torneo'
  # get "tournaments/:id/pdf", to: "tournaments#pdf", as: 'pdf'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  namespace :api do
    namespace :v1 do
      resources :tournaments, only: [:index, :show]
      resources :users, only: [:show]
      resources :teams
    end
  end
end
