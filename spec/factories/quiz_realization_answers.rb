# This will guess the User class
FactoryBot.define do
  factory :quiz_realization_answer, class: "QuizRealizationAnswer" do
    answer { 1 }
    question
    quiz_realization
  end
end
