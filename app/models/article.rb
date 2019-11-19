class Article < ApplicationRecord
	attachment :article_image

	validates :article_title, presence: true
	validates :article_category, presence: true
	validates :article_body, presence: true
end
