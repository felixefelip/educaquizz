# This will guess the User class
FactoryBot.define do
  factory :question, class: "Question" do
    description { "Quando foi descorberto o Brasil?" }
    alternative1 { "1520" }
    alternative2 { "Nunca" }
    alternative3 { "1500" }
    correct_answer { 3 }
    difficulty { 1 }
    quiz
  end
end
