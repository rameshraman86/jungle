class UpdateUsersColumns < ActiveRecord::Migration[6.1]
  def change
    remove_column :users, :name
    remove_column :users, :username
    remove_column :users, :password

    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :email, :string
  end
end