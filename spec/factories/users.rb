FactoryBot.define do
  factory :user do
    name { '山田太郎' }
    email { 'test@example.com' }
    password { '123456' }
    password_confirmation { '123456' }
    role { 'user' }
  end
end
