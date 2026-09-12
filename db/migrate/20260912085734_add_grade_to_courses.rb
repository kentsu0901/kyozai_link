class AddGradeToCourses < ActiveRecord::Migration[7.1]
  def change
    add_column :courses, :grade, :integer, null: false
  end
end
