FactoryBot.define do
  factory :course_material do
    association :course
    association :material
  end
end
