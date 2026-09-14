class CreateUserSubjects < ActiveRecord::Migration[7.1]
  def change
    create_table :user_subjects do |t|
      t.references :user, null: false, foreign_key: true
      t.references :subject, null: false, foreign_key: true

      t.timestamps
    end

    add_index :user_subjects, [:user_id, :subject_id], unique: true
  end
end
