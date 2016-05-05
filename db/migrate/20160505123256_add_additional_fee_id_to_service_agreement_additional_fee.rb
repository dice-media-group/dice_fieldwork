class AddAdditionalFeeIdToServiceAgreementAdditionalFee < ActiveRecord::Migration
  def change
    add_column :service_agreement_additional_fees, :additional_fee_id, :integer
  end
end
