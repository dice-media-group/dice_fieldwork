class RemoveAccountIdFromAccount < ActiveRecord::Migration
  def change
    remove_column :accounts, :account_id, :integer
  end
end
