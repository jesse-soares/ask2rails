FactoryGirl.define do
  factory :question do
    title "TITLE"
    description "DESCRIPTION"
    association :user
    association :category
  end
end