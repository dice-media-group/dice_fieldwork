class CreateOrderItems < ActiveRecord::Migration
  def change
    create_table :order_items do |t|
      t.belongs_to :service, index: true, foreign_key: true
      t.belongs_to :order, index: true, foreign_key: true
      t.decimal :unit_price,  precision: 12, scale: 3
      t.integer :quantity
      t.decimal :total_price,  precision: 12, scale: 3

      t.timestamps null: false
    end
  end
end
