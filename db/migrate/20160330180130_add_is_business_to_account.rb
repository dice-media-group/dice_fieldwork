class AddIsBusinessToAccount < ActiveRecord::Migration
  def change
    add_column :accounts, :is_business, :boolean
  end
end
