class AddAddlFeesToServiceAgreement < ActiveRecord::Migration
  def change
    add_column :service_agreements, :mice_and_rat_warranty, :boolean
    add_column :service_agreements, :scorpion, :boolean
    add_column :service_agreements, :cockroach, :boolean
    add_column :service_agreements, :bed_bugs, :boolean
  end
end
