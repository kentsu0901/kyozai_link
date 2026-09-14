class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :user_subjects
  has_many :subjects, through: :user_subjects

  validates :name, presence: true
  attribute :role, :string, default: 'user'
end
