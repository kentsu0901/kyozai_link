class Material < ApplicationRecord
  belongs_to :subject

  validates :name, presence: true
  validates :publisher, presence: true
  validates :material_type, presence: true
  validates :price, presence: true
end
