Rails.application.routes.draw do
  root 'quizzes#index'

  resources :quizzes do
    resources :questions
  end

  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
