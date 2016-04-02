class CreatePaymentMethods < ActiveRecord::Migration
  def change
    create_table :payment_methods do |t|
      t.string :card_number
      t.string :expiration
      t.string :cvc
      t.string :card_type
      t.belongs_to :account, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
