FactoryBot.define do
  factory :material do
    name { '数学Ⅰ' }
    publisher { '数研出版' }
    material_type { :textbook }
    price { 1000 }

    association :subject
  end
end
