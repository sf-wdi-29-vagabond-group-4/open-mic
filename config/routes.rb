Rails.application.routes.draw do
  root to: "users#home"

  resources :venues do
    resources :comments
  end
  resources :users

  #sign in routes
  get "/sign_in", to: "sessions#new"
  post "/sessions", to: "sessions#create"
  delete "/sessions", to: "sessions#destroy", as: "delete"

  #city routes
  get "/venues/city/:city", to: "venues#city", as: "city"
  
  #visit routes
  post '/venues/:id', to: "users#visit", as: "new_visit"

  #comment routes
  # post '/venues/:id/comments', to: "comments#create", as: "new_comment"

end
