json.array!(@meals) do |meal|
	json.start meal.start_date
	json.end meal.end_date
	json.url meal_url(meal, format: :html)
end