class Food < ApplicationRecord
	has_many :food_points, dependent: :destroy

end
