FactoryBot.define do
  factory :user, class: "User" do
    sequence(:email) { |n| "fulano#{n}@unigranrio.br" }
    password { "123456" }
  end
end
