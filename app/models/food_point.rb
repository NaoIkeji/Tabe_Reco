class FoodPoint < ApplicationRecord
	belongs_to :meal
	belongs_to :food

	validates :food_id, presence: true
	validates :point, presence: true
end
