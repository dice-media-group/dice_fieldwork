class AddUserIdToServiceAgreement < ActiveRecord::Migration
  def change
    add_reference :service_agreements, :user, index: true, foreign_key: true
  end
end
