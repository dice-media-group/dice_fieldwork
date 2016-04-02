class AddBelogsToAccount < ActiveRecord::Migration
  def change
    add_reference :accounts, :account, index: true, foreign_key: true
  end
end
