class ChangeColumnToContact < ActiveRecord::Migration[5.2]
  def change
  	change_column :contacts, :status, :string, default: "未対応"
  end
end
