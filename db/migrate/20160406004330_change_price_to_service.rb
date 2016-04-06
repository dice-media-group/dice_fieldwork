class ChangePriceToService < ActiveRecord::Migration
  def change
    change_column :services, :price, :decimal,  precision: 12, scale: 3, null: false, default: '0'
    
  end
end
