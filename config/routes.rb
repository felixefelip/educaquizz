Rails.application.routes.draw do
  root "quizzes#index"

  devise_for :users

  devise_scope :user do
    get "/users/sign_out" => "devise/sessions#destroy"
  end

  resources :quizzes do
    resources :questions
    resources :teacher_quiz_realizations, only: :create
  end

  resources :teacher_quiz_realizations, only: %i[index show] do
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
