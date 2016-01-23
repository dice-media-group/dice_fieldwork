class AddIsBillingAddressToAddresses < ActiveRecord::Migration
  def change
    add_column :addresses, :is_billing, :boolean
  end
end
