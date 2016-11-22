class CreateTableImages < ActiveRecord::Migration[5.0]
  def change
    create_table :images do |table|
      table.string :src
      table.integer :user_id
      table.string :caption
    end
  end
end
