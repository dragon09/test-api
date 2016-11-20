class CreateAccountsTable < ActiveRecord::Migration[5.0]
  def change
    create_table :accounts do |table|
      table.string :name
      table.string :lastname
      table.string :email
      table.string :username
      table.string :password
      table.boolean :is_author
    end
  end
end
