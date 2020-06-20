FactoryBot.define do
  factory :user, class: User do
    name {"tester"}
    sequence(:email) { |n| "test#{n}@example.com"}
    password              {"password"}
    password_confirmation {"password"}
  end
  
  factory :other_user, class: User do
    name {"other"}
    sequence(:email) { |n| "other#{n}@example.com"}
    password              {"password"}
    password_confirmation {"password"}
  end
end
