Rails.application.routes.draw do
  root to: 'pages#index'
  get "help"  => "static_pages#help",     :as => "help"
  get "library"  => "sources#index",     :as => "library"
  get "tracks"  => "tracks#index",        :as => "tracks"
  get "goals"  => "goals#index",          :as => "goals"
  get "search"  => "sources#search",      :as => "search_page"
  post "search"  => "sources#search",     :as => "search"
  get "login"   => "sessions#new",        :as => "login"
  get "logout"  => "sessions#destroy",    :as => "logout"
  get "signup"  => "users#new",           :as => "signup"
  resources :sessions, only: [:create]
  resources :users do
    resources :tracks do
      resources :goals do
        resources :sources
      end
    end
  end

end
