class RemoveAteDateFromMeals < ActiveRecord::Migration[5.2]
  def change
    remove_column :meals, :ate_date, :integer
  end
end
