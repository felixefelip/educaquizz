FactoryBot.define do
  factory :teacher_quiz_realization, class: "Quiz::TeacherQuizRealization::Record" do
    quiz
    teacher factory: :user
  end
end
