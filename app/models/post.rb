class Post < ApplicationRecord
	belongs_to :user
	has_many :comments
	has_many :favorites, dependent: :destroy
	has_many :cheers, dependent: :destroy
	# belongs_to :target
	attachment :post_image

	def favorited_by?(user)
    	favorites.where(user_id: user.id).exists?
  	end

  	def cheered_by?(user)
  		cheers.where(user_id: user.id).exists?
  	end

end
