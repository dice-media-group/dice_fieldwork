class AddAppointmentDateAndTimeToServiceAgreement < ActiveRecord::Migration
  def change
    add_column :service_agreements, :appointment_date_and_time, :datetime
  end
end
