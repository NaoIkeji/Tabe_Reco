class Article < ApplicationRecord
	belongs_to :article_genre
	attachment :article_image

	validates :article_title, presence: true
	validates :article_genre_id, presence: true
	validates :article_body, presence: true
end
