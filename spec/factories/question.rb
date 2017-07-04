FactoryGirl.define do
  factory :question do
    sequence(:title) { |n| "QUESTION #{n}" }
    description "DESCRIPTION"
    association :user
    association :category
  end
end