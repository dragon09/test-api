class AddPostIdToComments < ActiveRecord::Migration[5.0]
  def change
  	remove_column :comments, :image_id
  	add_column :comments, :post_id, :integer
  end
end
