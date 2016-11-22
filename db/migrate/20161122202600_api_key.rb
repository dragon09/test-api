class ApiKey < ActiveRecord::Migration[5.0]
  def change
    add_column :accounts, :api_key, :string
  end
end
