class CreateAcademicYears < ActiveRecord::Migration[7.1]
  def change
    create_table :academic_years do |t|
      t.integer :year, null: false

      t.timestamps
    end

    add_index :academic_years, :year, unique: true
  end
end
