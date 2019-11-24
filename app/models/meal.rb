class Meal < ApplicationRecord
	belongs_to :user
	has_many :food_points, dependent: :destroy
	accepts_nested_attributes_for :food_points, allow_destroy: true
	attachment :meal_image

	validates :ate_date, presence: true
	validates :ate_time, presence: true
	validates :meal_item, presence: true
	validates :meal_text, length: { maximum: 200}
end
