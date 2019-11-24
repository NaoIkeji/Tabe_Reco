class Post < ApplicationRecord
	belongs_to :user
	has_many :comments, dependent: :destroy
	has_many :favorites, dependent: :destroy
	has_many :cheers, dependent: :destroy
	attachment :post_image

	validates :post_target, presence: true
	validates :post_body, presence: true
	validates :post_body, length: { maximum: 300 }

	def favorited_by?(user)
    	favorites.where(user_id: user.id).exists?
  	end

  	def cheered_by?(user)
  		cheers.where(user_id: user.id).exists?
  	end

end
