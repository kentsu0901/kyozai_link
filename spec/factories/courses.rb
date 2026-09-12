FactoryBot.define do
  factory :course do
    name { '数学Ⅰ' }
    association :subject
    association :academic_year
  end
end
