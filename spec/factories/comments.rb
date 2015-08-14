FactoryGirl.define do
  factory :comment do
    body "That sucks!"
    upvotes 0
    association :post
  end
end
