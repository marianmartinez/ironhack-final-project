Rails.application.routes.draw do
  resources :tracks
  root to: 'pages#index'
  get "help"  => "static_pages#help",           :as => "help"
  get "login"   => "sessions#new",        :as => "login"
  get "logout"  => "sessions#destroy",    :as => "logout"
  get "signup"  => "users#new",           :as => "signup"
  resources :tracks
  resources :users
  resources :sessions, only: [:create]
end
