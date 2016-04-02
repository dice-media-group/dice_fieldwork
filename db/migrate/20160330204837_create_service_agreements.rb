class CreateServiceAgreements < ActiveRecord::Migration
  def change
    create_table :service_agreements do |t|
      t.text :field_tech_signature
      t.text :customer_signature
      t.text :customers_initials_for_charges

      t.timestamps null: false
    end
  end
end
