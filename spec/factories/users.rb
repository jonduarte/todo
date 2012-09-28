FactoryGirl.define do
  factory :user do
    sequence(:email) { |n| "joe#{n}@joe.com" }
    password "secr3t"
  end
end
