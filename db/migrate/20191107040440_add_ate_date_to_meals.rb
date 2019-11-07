class AddAteDateToMeals < ActiveRecord::Migration[5.2]
  def change
    add_column :meals, :ate_date, :date
  end
end
