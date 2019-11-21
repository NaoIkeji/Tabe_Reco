class AddPostTargetComments < ActiveRecord::Migration[5.2]
  def change
  	add_column :comments, :post_target, :string
	add_column :comments, :post_body, :text
  end
end
