FactoryGirl.define do
  factory :user do
    sequence(:email)    { |i| "user#{i}@example.com" }
    sequence(:username) { |i| "user#{i}" }
    password "f00barbaz"
  end
end
