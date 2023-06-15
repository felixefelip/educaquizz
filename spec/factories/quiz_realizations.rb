FactoryBot.define do
  factory :quiz_realization, class: "Quiz::Realization::Record" do
    user
    quiz_availability
  end
end
