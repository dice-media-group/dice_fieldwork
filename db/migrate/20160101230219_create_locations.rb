class CreateLocations < ActiveRecord::Migration
  def change
    create_table :locations do |t|
      t.string :name
      t.belongs_to :account, index: true
      

      t.timestamps null: false
    end
  end
end
