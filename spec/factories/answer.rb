FactoryGirl.define do
  factory :answer do
    sequence(:content) { |n| "Answer #{n}" }
    association :user
    association :question
  end
end