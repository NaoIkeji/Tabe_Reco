class Food < ApplicationRecord
	has_many :food_points, dependent: :destroy

	validates :food_item, presence: true
	validates :food_item, uniqueness: true

	validates :food_category, presence: true
	validates :food_color, presence: true

end
