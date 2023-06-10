# This will guess the User class
FactoryBot.define do
  factory :quiz_realization, class: "QuizRealization::Record" do
    user
    teacher_quiz_realization
  end
end
