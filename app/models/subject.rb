class Subject < ApplicationRecord
  has_many :courses

  validates :name, presence: true, uniqueness: true
  validates :sort_order, presence: true, uniqueness: true
end
