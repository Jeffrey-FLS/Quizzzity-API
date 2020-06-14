Rails.application.routes.draw do

  # Committing 

  namespace :api do
    namespace :v1 do
      resources :quizzes
      resources :questions
      resources :users

      post "/quizzes", to: "quizzes#create"
      get '/login', to: 'login#new'
    end
  end

end
