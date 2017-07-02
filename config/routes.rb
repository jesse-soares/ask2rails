Rails.application.routes.draw do
  root to: "questions#index"

  get  "/signup", to: "users#new"
  post "/signup", to: "users#create"

  get  "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  get  "/logout", to: "sessions#destroy"

  get  "questions/new", to: "questions#new", as: :new_question
  post "questions/new", to: "questions#create", as: false
  get  "questions/:id", to: "questions#show", as: :question
end
