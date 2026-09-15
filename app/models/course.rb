class Course < ApplicationRecord
  belongs_to :subject
  belongs_to :academic_year

  has_many :course_materials
  has_many :materials, through: :course_materials

  validates :name, presence: true
  validates :grade, presence: true
end
