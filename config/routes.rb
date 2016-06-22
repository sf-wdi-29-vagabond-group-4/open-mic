Rails.application.routes.draw do
  root to: "users#home"

  get "/users", to: "users#index", as: "users"
  get "/users/new", to: "users#new", as: "new_user"
  post "/users", to: "users#create"
  get "/users/:id/edit", to: "users#edit", as: "edit_user"
  get "/users/:id", to: "users#show", as: "user"
  patch "/users/:id", to: "users#update"
  delete "/users/:id", to: "users#delete"

  get "/sign_in", to: "sessions#new"

  post "/sessions", to: "sessions#create"
  delete "/sessions", to: "sessions#destroy", as: "delete"

  resources :venues
end








