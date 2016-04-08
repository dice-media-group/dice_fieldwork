class AddServiceAgreementToOrder < ActiveRecord::Migration
  def change
    add_reference :orders, :service_agreement, index: true, foreign_key: true
  end
end
