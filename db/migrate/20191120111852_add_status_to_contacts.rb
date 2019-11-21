class AddStatusToContacts < ActiveRecord::Migration[5.2]
  def change
    add_column :contacts, :status, :string
    add_column :contacts, :default, :string
    add_column :contacts, :未対応, :string
  end
end
