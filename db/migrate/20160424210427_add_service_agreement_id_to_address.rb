class AddServiceAgreementIdToAddress < ActiveRecord::Migration
  def change
    add_column :addresses, :service_agreement_id, :integer
  end
end
