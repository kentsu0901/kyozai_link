FactoryBot.define do
  factory :course do
    name { '数学Ⅰ' }
    grade { 1 }
    association :subject
    association :academic_year
  end
end
