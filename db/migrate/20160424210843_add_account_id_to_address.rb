class AddAccountIdToAddress < ActiveRecord::Migration
  def change
    add_column :addresses, :account_id, :integer
  end
end
