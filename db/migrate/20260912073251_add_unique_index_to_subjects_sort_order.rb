class AddUniqueIndexToSubjectsSortOrder < ActiveRecord::Migration[7.1]
  def change
    add_index :subjects, :sort_order, unique: true
  end
end
