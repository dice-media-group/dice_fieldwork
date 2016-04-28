class AddPaymentMethodDescriptionToPaymentArrangement < ActiveRecord::Migration
  def change
    add_column :payment_arrangements, :payment_method_description, :string
  end
end
