class AddArticleGenreIdToArticles < ActiveRecord::Migration[5.2]
  def change
    add_column :articles, :article_genre_id, :integer
  end
end
