Rails.application.routes.draw do
  root to: "users#home"

  get "/users", to: "users#index", as: "users"
  get "/users/new", to: "users#new", as: "new_user"
  post "/users", to: "users#create"
  get "/users/:id", to: "users#show", as: "user"
  get "/users/:id/edit", to: "users#edit"
  patch "/users/:id", to: "users#update"
  
  get "/sign_in", to: "sessions#new"
  
  post "/sessions", to: "sessions#create"
  delete "/sessions", to: "sessions#destroy", as: "delete"
  
  resources :venues
end








