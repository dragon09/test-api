class CreateCommentsTable < ActiveRecord::Migration[5.0]
  def change
    create_table :comments do |table|
      table.string :content
      table.integer :user_id
      table.integer :image_id
    end
  end
end
