class AddContactInfoToAccount < ActiveRecord::Migration
  def change
    add_column :accounts, :mobile_phone, :string
    add_column :accounts, :fax, :string
  end
end
