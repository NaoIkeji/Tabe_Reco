class CreateArticles < ActiveRecord::Migration[5.2]
  def change
    create_table :articles do |t|
      t.string :article_title
      t.string :article_category
      t.string :article_image_id
      t.text :article_body

      t.timestamps
    end
  end
end
