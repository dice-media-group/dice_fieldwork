class AddSalesRepToUser < ActiveRecord::Migration
  def change
    add_column :users, :is_sales_rep, :boolean, :default => false
  end
end
