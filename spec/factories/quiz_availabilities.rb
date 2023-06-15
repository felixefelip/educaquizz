FactoryBot.define do
  factory :quiz_availability, class: "Quiz::Availability::Record" do
    quiz
    teacher factory: :user
  end
end
