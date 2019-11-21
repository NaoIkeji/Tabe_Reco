class RemoveStatusFromContacts < ActiveRecord::Migration[5.2]
  def change
    remove_column :contacts, :status, :string
  end
end
