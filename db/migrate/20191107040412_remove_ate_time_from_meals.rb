class RemoveAteTimeFromMeals < ActiveRecord::Migration[5.2]
  def change
    remove_column :meals, :ate_time, :integer
  end
end
