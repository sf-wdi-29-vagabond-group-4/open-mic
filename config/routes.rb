Rails.application.routes.draw do
  root to: "users#home"

  resources :venues
  resources :users

  get "/sign_in", to: "sessions#new"
  post "/sessions", to: "sessions#create"
  delete "/sessions", to: "sessions#destroy", as: "delete"

  post '/venues/:id', to: "users#visit", as: "new_visit"

end
