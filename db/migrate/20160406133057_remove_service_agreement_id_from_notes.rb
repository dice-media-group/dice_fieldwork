class RemoveServiceAgreementIdFromNotes < ActiveRecord::Migration
  def change
    remove_column :notes, :service_agreement_id, :integer
  end
end
