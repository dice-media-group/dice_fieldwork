class CreateServiceAgreementAdditionalFees < ActiveRecord::Migration
  def change
    create_table :service_agreement_additional_fees do |t|
      t.string :service_id
      t.string :service_agreement_id

      t.timestamps null: false
    end
  end
end
