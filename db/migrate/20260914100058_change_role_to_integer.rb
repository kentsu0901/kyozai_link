class ChangeRoleToInteger < ActiveRecord::Migration[7.1]
  def up
    add_column :users, :role_integer, :integer, null: false, default: 1

    User.reset_column_information

    User.where(role: 'user').update_all(role_integer: 1)
    User.where(role: 'system_admin').update_all(role_integer: 2)

    remove_column :users, :role
    rename_column :users, :role_integer, :role
  end

  def down
    add_column :users, :role_string, :string, null: false, default: 'user'

    User.reset_column_information

    User.where(role: 1).update_all(role_string: 'user')
    User.where(role: 2).update_all(role_string: 'system_admin')

    remove_column :users, :role
    rename_column :users, :role_string, :role
  end
end