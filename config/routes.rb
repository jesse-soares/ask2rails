Rails.application.routes.draw do
  get "/", to: "questions#index"

  get  "/signup", to: "users#new"
  post "/signup", to: "users#create"

  get  "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
end
