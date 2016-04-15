class CreatePesticideAppLogs < ActiveRecord::Migration
  def change
    create_table :pesticide_app_logs do |t|
      t.string :applicator_name
      t.datetime :start_time
      t.datetime :stop_time
      t.string :temperature
      t.string :wind_speed_direction
      t.string :pesticide_manufacturer
      t.string :trade_name
      t.string :epa_reg_formulation
      t.string :rate_product_dilutent_per_acre
      t.string :crop_or_site_and_crop_stage
      t.string :pests
      t.string :equipment_used
      t.string :acres_or_area_treated
      t.string :location_one
      t.string :location_two
      t.text :comments_map

      t.timestamps null: false
    end
  end
end
