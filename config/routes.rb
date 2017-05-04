Rails.application.routes.draw do
  resources :users
  resources :teams
  resources :tournaments
  # Si le agrego do resources :matches end, entonces las rutas serán tournaments/1/matches.
  # se podrá ir directamente a matches. Para teams-players es lo mismo. En el fondo
  # con esto se evita que una clase que no viva "sola" esté siempre dentro de otra cosa. 
  resources :matches
  resources :players
  root 'users#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
