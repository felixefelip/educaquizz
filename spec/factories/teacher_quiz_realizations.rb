# This will guess the User class
FactoryBot.define do
  factory :teacher_quiz_realization, class: "TeacherQuizRealization" do
    quiz
    teacher factory: :user
  end
end
