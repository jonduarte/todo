FactoryGirl.define do
  factory :user do
    sequence :email do
      "joe#{n}@joe.com"
    end
    password "secr3t"
  end
end
