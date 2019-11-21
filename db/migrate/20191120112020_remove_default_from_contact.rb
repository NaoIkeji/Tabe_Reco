class RemoveDefaultFromContact < ActiveRecord::Migration[5.2]
  def change
    remove_column :contacts, :default, :string
    remove_column :contacts, :未対応, :string
  end
end
