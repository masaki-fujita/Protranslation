Rails.application.routes.draw do
  root to: "toppages#index"
  
  get "login", to: "sessions#new"
  post "login", to: "sessions#create"
  delete "logout", to: "sessions#destroy"
  
  get "signup", to: "users#new"
  resources :users, only: [:new, :create]
  
  get "search_results", to: "toppages#search_results"
  
  resources :preservations, only: [:index, :show, :new, :create]
end
