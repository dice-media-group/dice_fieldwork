class CreateAddresses < ActiveRecord::Migration
  def change
    create_table :addresses do |t|
      t.string :street_one
      t.string :street_two
      t.string :city
      t.string :state
      t.string :postal_code
      t.references :addressable, polymorphic: true, index: true
      

      t.timestamps null: false
    end
  end
end
