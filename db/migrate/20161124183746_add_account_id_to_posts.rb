class AddAccountIdToPosts < ActiveRecord::Migration[5.0]
  def change
  	add_column :posts, :account_id, :integer
  end
end
