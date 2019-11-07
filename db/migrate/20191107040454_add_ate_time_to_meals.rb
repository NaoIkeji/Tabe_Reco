class AddAteTimeToMeals < ActiveRecord::Migration[5.2]
  def change
    add_column :meals, :ate_time, :time
  end
end
