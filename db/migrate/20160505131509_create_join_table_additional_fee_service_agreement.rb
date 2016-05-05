class CreateJoinTableAdditionalFeeServiceAgreement < ActiveRecord::Migration
  def change
    create_join_table :additional_fees, :service_agreements do |t|
      # t.index [:additional_fee_id, :service_agreement_id]
      # t.index [:service_agreement_id, :additional_fee_id]
    end
  end
end
