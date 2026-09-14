class CreateMaterials < ActiveRecord::Migration[7.1]
  def change
    create_table :materials do |t|
      t.string :name, null: false
      t.string :publisher, null: false
      t.string :material_type, null: false
      t.integer :price, null: false, default: 0
      t.references :subject, null: false, foreign_key: true

      t.timestamps
    end
  end
end
