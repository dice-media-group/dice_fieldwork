class CreateServices < ActiveRecord::Migration
  def change
    create_table :services do |t|
      t.string :name
      t.text :description
      t.decimal :price, precision: 10, scale: 2

      t.timestamps null: false
    end
    add_index :services, :name, unique: true
  end
end
