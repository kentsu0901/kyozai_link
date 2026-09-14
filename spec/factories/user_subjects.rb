FactoryBot.define do
  factory :user_subject do
    association :user
    association :subject
  end
end
