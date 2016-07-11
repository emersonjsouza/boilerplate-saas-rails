class ChangeUserIdToAccounts < ActiveRecord::Migration
  def change
    add_column :accounts, :owner_id, :integer, :null => false
  end
end
