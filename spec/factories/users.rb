FactoryBot.define do
  factory :user do
    username { "AAA" }
    sequence(:email) { |n| "tester#{n}@example.com" }
    password { "password" }
  end
end
