FactoryGirl.define do
  factory :post do
    title "Oh my wow, it's google"
    link "www.google.com"
    upvotes 0
    association :user
  end
end
