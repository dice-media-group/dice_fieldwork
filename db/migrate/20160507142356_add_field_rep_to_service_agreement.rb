class AddFieldRepToServiceAgreement < ActiveRecord::Migration
  def change
    add_column :service_agreements, :field_rep, :string
  end
end
