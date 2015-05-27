Rails.application.routes.draw do

  root to: 'pages#index'
  get "help"    => "static_pages#help", :as => "help"

  # Users
  resources :users
  get "signup"  => "users#new",         :as => "signup"

  # Sessions
  get "login"   => "sessions#new",      :as => "login"
  get "logout"  => "sessions#destroy",  :as => "logout"
  resources :sessions, only: [:create]

  get "library" => "sources#index",     :as => "library"
  get "search"  => "sources#search"
  post "search" => "sources#search"

  # Bussiness objects
  resources :tracks do
    resources :goals
  end
  resources :goals
  resources :sources

end
