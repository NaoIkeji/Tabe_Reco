class ArticleGenre < ApplicationRecord
	has_many :articles, dependent: :destroy

	validates :genre_name, uniqueness: true, presence: true


end
