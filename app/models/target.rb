class Target < ApplicationRecord
	belongs_to :user
	# has_many :post
	validates :target_body, length: { maximum: 30 }
end
