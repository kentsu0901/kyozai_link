class Subject < ApplicationRecord
  has_many :courses
  has_many :materials
  has_many :user_subjects
  has_many :users, through: :user_subjects

  validates :name, presence: true, uniqueness: true
  validates :sort_order, presence: true, uniqueness: true
end
