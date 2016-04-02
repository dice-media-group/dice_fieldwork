class AddAccountToServiceAgreement < ActiveRecord::Migration
  def change
    add_reference :service_agreements, :account, index: true, foreign_key: true
  end
end
