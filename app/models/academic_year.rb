class AcademicYear < ApplicationRecord
  has_many :courses

  validates :year, presence: true, uniqueness: true
end
