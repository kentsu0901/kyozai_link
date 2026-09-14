class CreateCourseMaterials < ActiveRecord::Migration[7.1]
  def change
    create_table :course_materials do |t|
      t.references :course, null: false, foreign_key: true
      t.references :material, null: false, foreign_key: true

      t.timestamps
    end

    add_index :course_materials, [:course_id, :material_id], unique: true
  end
end
