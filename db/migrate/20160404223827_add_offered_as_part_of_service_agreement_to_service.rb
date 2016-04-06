class AddOfferedAsPartOfServiceAgreementToService < ActiveRecord::Migration
  def change
    add_column :services, :part_of_service_agreement_start_date, :date
    add_column :services, :part_of_service_agreement_end_date, :date
  end
end
