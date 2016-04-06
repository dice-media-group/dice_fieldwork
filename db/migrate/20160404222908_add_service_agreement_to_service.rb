class AddServiceAgreementToService < ActiveRecord::Migration
  def change
    add_reference :services, :service_agreement, index: true, foreign_key: true
  end
end
