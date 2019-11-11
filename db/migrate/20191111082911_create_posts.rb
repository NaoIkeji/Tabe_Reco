class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.string :post_image_id
      t.string :post_target
      t.text :post_body

      t.timestamps
    end
  end
end
