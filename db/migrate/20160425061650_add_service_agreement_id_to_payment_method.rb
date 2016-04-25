class AddServiceAgreementIdToPaymentMethod < ActiveRecord::Migration
  def change
    add_column :payment_methods, :service_agreement_id, :integer
  end
end
