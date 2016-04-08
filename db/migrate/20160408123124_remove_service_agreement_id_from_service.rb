class RemoveServiceAgreementIdFromService < ActiveRecord::Migration
  def change
    remove_column :services, :service_agreement_id, :integer
  end
end
