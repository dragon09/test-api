class CreateCommentsTable < ActiveRecord::Migration[5.0]
  def change
    create_table :comments do |table|
      table.string :content
      table.string :user_id
      table.string :image_id
  end
end
