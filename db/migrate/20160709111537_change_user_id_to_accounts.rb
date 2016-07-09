class ChangeUserIdToAccounts < ActiveRecord::Migration
  def change
    rename_column :accounts, :user_id, :owner_id
  end
end
