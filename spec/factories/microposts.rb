FactoryBot.define do
  factory :micropost do
    content { "MyText" }
    association :user, factory: :user

    trait :today do
      created_at { 1.hour.ago }
    end

    trait :yesterday do
      created_at { 1.day.ago }
    end
  end
end
