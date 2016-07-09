class ChangeFirnameToContacts < ActiveRecord::Migration
  def change
    rename_column :contacts, :firname, :firstname
  end
end
