Rails.application.routes.draw do
  root "quizzes#index"

  devise_for :users

  devise_scope :user do
    get "/users/sign_out" => "devise/sessions#destroy"
  end

  resources :quizzes do
    resources :questions

    resources :quiz_realizations, only: :create
  end

  resources :questions, only: :show do
    resources :quiz_realizations, only: [] do
      resources :quiz_realization_answers, only: %i[new create]
    end
  end

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
