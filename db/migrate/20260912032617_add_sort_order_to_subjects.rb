class AddSortOrderToSubjects < ActiveRecord::Migration[7.1]
  def change
    add_column :subjects, :sort_order, :integer, null: false
  end
end
