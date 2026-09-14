class ChangeMaterialTypeToInteger < ActiveRecord::Migration[7.1]
  def change
    change_column :materials, :material_type, :integer, null: false
  end
end
