class AddFirstNameToAccount < ActiveRecord::Migration
  def change
    add_column :accounts, :first_name, :string
    add_column :accounts, :last_name, :string
    add_column :accounts, :email, :text
    add_column :accounts, :no_customer_email_address, :boolean
    add_column :accounts, :primary_phone_number, :string
    add_column :accounts, :secondary_phone_number, :string
  end
end
