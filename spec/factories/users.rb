FactoryBot.define do
  factory :user, class: "User::Record" do
    sequence(:email) { |n| "fulano#{n}@unigranrio.br" }
    password { "123456" }
  end
end
