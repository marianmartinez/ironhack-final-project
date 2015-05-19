Rails.application.routes.draw do
  root to: 'static_pages#home'
  resources :users
  resources :sessions, only: [:new, :create, :destroy]
end
