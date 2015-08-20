FactoryGirl.define do
  factory :comment do
    body "That sucks!"
    upvotes 0
    association :post
    association :user
  end
end
