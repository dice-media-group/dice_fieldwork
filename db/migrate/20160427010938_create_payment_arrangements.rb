class CreatePaymentArrangements < ActiveRecord::Migration
  def change
    create_table :payment_arrangements do |t|
      t.decimal :initial_charge_amount, precision: 12, scale: 3, default: 0.0, null: false
      t.decimal :recurring_charge_amount, precision: 12, scale: 3, default: 0.0, null: false
      t.text :customer_initials
      t.belongs_to :service_agreement, index: true, foreign_key: true
      t.string :payment_frequency
      t.date :start_date

      t.timestamps null: false
    end
  end
end
