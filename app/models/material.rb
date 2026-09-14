class Material < ApplicationRecord
  belongs_to :subject
  has_many :course_materials
  has_many :courses, through: :course_materials

  enum :material_type, {
    textbook: 1,
    supplementary: 2
  }

  validates :name, presence: true
  validates :publisher, presence: true
  validates :material_type, presence: true
  validates :price, presence: true
end
