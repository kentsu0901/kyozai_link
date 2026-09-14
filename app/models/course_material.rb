class CourseMaterial < ApplicationRecord
  belongs_to :course
  belongs_to :material

  validates :material_id, uniqueness: { scope: :course_id }
end
