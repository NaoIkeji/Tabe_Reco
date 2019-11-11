class CreateTargets < ActiveRecord::Migration[5.2]
  def change
    create_table :targets do |t|
      t.text :target_body

      t.timestamps
    end
  end
end
