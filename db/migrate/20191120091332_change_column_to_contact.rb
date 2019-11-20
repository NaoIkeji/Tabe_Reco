class ChangeColumnToContact < ActiveRecord::Migration[5.2]
  def up
    change_column :contacts, :status, :string
  end

  def down
    change_column :contacts, :status, :string, default: "未対応"
  end

end
