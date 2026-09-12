class AcademicYear < ApplicationRecord
  validates :year, presence: true, uniqueness: true
end
