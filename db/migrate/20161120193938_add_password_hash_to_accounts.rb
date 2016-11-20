class AddPasswordHashToAccounts < ActiveRecord::Migration[5.0]
  def change
    add_column :accounts, :password_salt, :string
  end
end
