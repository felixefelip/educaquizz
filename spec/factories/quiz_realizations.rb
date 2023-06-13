FactoryBot.define do
  factory :quiz_realization, class: "Quiz::Realization::Record" do
    user
    teacher_quiz_realization
  end
end
