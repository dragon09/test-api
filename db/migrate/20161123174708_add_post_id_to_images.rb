class AddPostIdToImages < ActiveRecord::Migration[5.0]
  def change
    add_column :images, :post_id, :integer
  end
end
