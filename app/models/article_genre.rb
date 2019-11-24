class ArticleGenre < ApplicationRecord
	has_many :articles, dependent: :destroy

	validates :genre_name, precence: true

end
