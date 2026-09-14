FactoryBot.define do
  factory :subject do
    sequence(:name) { |n| "教科#{n}" }
    sequence(:sort_order) { |n| n }
  end
end
