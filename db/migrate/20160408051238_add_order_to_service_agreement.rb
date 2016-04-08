class AddOrderToServiceAgreement < ActiveRecord::Migration
  def change
    add_reference :service_agreements, :order, index: true, foreign_key: true
  end
end
