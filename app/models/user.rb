class User < ApplicationRecord
  devise :database_authenticatable,
         :recoverable, :rememberable, :validatable

  has_many :user_subjects
  has_many :subjects, through: :user_subjects

  enum :role, {
    user: 1,
    system_admin: 2
  }, default: :user

  validates :name, presence: true
end
