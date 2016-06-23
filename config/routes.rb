Rails.application.routes.draw do
  root to: "users#home"

  resources :venues
  resources :users

  get "/venues/city/:city", to: "venues#city", as: "city"

  get "/sign_in", to: "sessions#new"
  post "/sessions", to: "sessions#create"
  delete "/sessions", to: "sessions#destroy", as: "delete"

  post '/venues/:id', to: "users#visit", as: "new_visit"
  post '/venues/:id/comments', to: "venues#comment", as: "comment"

end
