class Meal < ApplicationRecord
	belongs_to :user
	has_many :food_points, dependent: :destroy
	accepts_nested_attributes_for :food_points, allow_destroy: true
	attachment :meal_image
end
