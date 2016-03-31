class AddCreditCardSignatureToServiceAgreement < ActiveRecord::Migration
  def change
    add_column :service_agreements, :credit_card_signature, :text
  end
end
