# This will guess the User class
FactoryBot.define do
  factory :quiz, class: "Quiz::Record" do
    description { "História" }
  end
end
