Rails.application.routes.draw do

  resources :questions
  namespace :api do
    namespace :v1 do
      resources :quizzes
      resources :questions
      resources :users

      post "/quizzes", to: "quizzes#create"
    end
  end

end
