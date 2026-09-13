class Course < ApplicationRecord
  belongs_to :subject
  belongs_to :academic_year

  validates :name, presence: true
  validates :grade, presence: true
end
