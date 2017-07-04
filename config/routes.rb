Rails.application.routes.draw do
  root to: "questions#index"

  get  "/signup", to: "users#new"
  post "/signup", to: "users#create"
  get  "/users/id", to: "users#show", as: :user

  get  "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  get  "/logout", to: "sessions#destroy"

  get    "questions/new", to: "questions#new", as: :new_question
  post   "questions/new", to: "questions#create", as: false
  get    "questions/:id", to: "questions#show", as: :question
  get    "questions/:id/remove", to: "questions#remove", as: :remove_question
  delete "questions/:id/remove", to: "questions#destroy", as: false

  post "questions/:question_id/answers", to: "answers#create", as: :new_answer
end
