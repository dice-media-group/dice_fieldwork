class AddSgiToServiceAgreement < ActiveRecord::Migration
  def change
    add_column :service_agreements, :satisfaction_guarantee_initials, :text
  end
end
