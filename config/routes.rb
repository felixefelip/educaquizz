Rails.application.routes.draw do
  root "home#index"

  resources :home, only: :index

  devise_for :users, class_name: "User::Record", controllers: { registrations: 'users/registrations'  }

  devise_scope :user do
    get "/users/sign_out" => "devise/sessions#destroy"
  end

  resources :quizzes do
    resources :questions
    resources :quiz_availabilities, only: %i[index create]
  end

  resources :quiz_availabilities, only: :show

  resources :quiz_availabilities, only: %i[index show] do
    resources :finish, only: :create, controller: "quiz_availabilities/finish"
    resources :quiz_realizations, only: :create
  end

  resources :quiz_realizations, only: :show

  resources :questions, only: :show do
    resources :quiz_realizations, only: [] do
      resources :quiz_realization_answers, only: :new, controller: "quiz_realization_answers/new"
      resources :quiz_realization_answers, only: :create, controller: "quiz_realization_answers/respond_question"
    end
  end
end
