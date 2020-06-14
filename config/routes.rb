Rails.application.routes.draw do

  # Committing

  namespace :api do
    namespace :v1 do
      resources :quizzes
      resources :questions
      resources :users

      post "/quizzes", to: "quizzes#create"
      post "/login", to: "users#login"
      # post "/login", to: "auth#login"
      # post '/login', to: 'auth#login'
      # get '/login', to: 'login#new'
    end
  end

end
