# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20160505181124) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "accounts", force: :cascade do |t|
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.string   "first_name"
    t.string   "last_name"
    t.text     "email"
    t.boolean  "no_customer_email_address"
    t.string   "primary_phone_number"
    t.string   "secondary_phone_number"
    t.string   "mobile_phone"
    t.string   "fax"
    t.boolean  "is_business"
    t.string   "referral_source"
    t.string   "company_name"
  end

  create_table "additional_fees", force: :cascade do |t|
    t.string   "name"
    t.decimal  "price",      precision: 8, scale: 2
    t.datetime "created_at",                         null: false
    t.datetime "updated_at",                         null: false
  end

  create_table "additional_fees_service_agreements", id: false, force: :cascade do |t|
    t.integer "additional_fee_id",    null: false
    t.integer "service_agreement_id", null: false
  end

  create_table "addresses", force: :cascade do |t|
    t.string   "street_one"
    t.string   "street_two"
    t.string   "city"
    t.string   "state"
    t.string   "postal_code"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
    t.boolean  "is_billing"
    t.integer  "service_agreement_id"
    t.integer  "account_id"
  end

  create_table "calendars", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.string   "color"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "carts", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "consultations", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.boolean  "is_all_day"
    t.date     "from_date"
    t.time     "from_time"
    t.date     "to_date"
    t.time     "to_time"
    t.string   "repeats"
    t.integer  "repeats_every_n_days"
    t.integer  "repeats_every_n_weeks"
    t.integer  "repeats_weekly_each_days_of_the_week_mask"
    t.integer  "repeats_every_n_months"
    t.string   "repeats_monthly"
    t.integer  "repeats_monthly_each_days_of_the_month_mask"
    t.integer  "repeats_monthly_on_ordinals_mask"
    t.integer  "repeats_monthly_on_days_of_the_week_mask"
    t.integer  "repeats_every_n_years"
    t.integer  "repeats_yearly_each_months_of_the_year_mask"
    t.boolean  "repeats_yearly_on"
    t.integer  "repeats_yearly_on_ordinals_mask"
    t.integer  "repeats_yearly_on_days_of_the_week_mask"
    t.string   "repeat_ends"
    t.date     "repeat_ends_on"
    t.string   "time_zone"
    t.integer  "calendar_id"
    t.datetime "created_at",                                  null: false
    t.datetime "updated_at",                                  null: false
    t.integer  "account_id"
    t.integer  "user_id"
  end

  create_table "line_items", force: :cascade do |t|
    t.integer  "service_id"
    t.integer  "cart_id"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.integer  "quantity",   default: 1
    t.decimal  "price"
    t.integer  "order_id"
  end

  add_index "line_items", ["cart_id"], name: "index_line_items_on_cart_id", using: :btree
  add_index "line_items", ["order_id"], name: "index_line_items_on_order_id", using: :btree
  add_index "line_items", ["service_id"], name: "index_line_items_on_service_id", using: :btree

  create_table "locations", force: :cascade do |t|
    t.string   "name"
    t.integer  "account_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "locations", ["account_id"], name: "index_locations_on_account_id", using: :btree

  create_table "notes", force: :cascade do |t|
    t.text     "content"
    t.integer  "notable_id"
    t.string   "notable_type"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "notes", ["notable_type", "notable_id"], name: "index_notes_on_notable_type_and_notable_id", using: :btree

  create_table "order_items", force: :cascade do |t|
    t.integer  "service_id"
    t.integer  "order_id"
    t.decimal  "unit_price",  precision: 12, scale: 3
    t.integer  "quantity"
    t.decimal  "total_price", precision: 12, scale: 3
    t.datetime "created_at",                           null: false
    t.datetime "updated_at",                           null: false
  end

  add_index "order_items", ["order_id"], name: "index_order_items_on_order_id", using: :btree
  add_index "order_items", ["service_id"], name: "index_order_items_on_service_id", using: :btree

  create_table "order_statuses", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "orders", force: :cascade do |t|
    t.string   "pay_type"
    t.datetime "created_at",                                    null: false
    t.datetime "updated_at",                                    null: false
    t.decimal  "subtotal",             precision: 12, scale: 3
    t.decimal  "tax",                  precision: 12, scale: 3
    t.decimal  "shipping",             precision: 12, scale: 3
    t.decimal  "total",                precision: 12, scale: 3
    t.integer  "order_status_id"
    t.integer  "service_agreement_id"
    t.integer  "account_id"
    t.integer  "user_id"
  end

  add_index "orders", ["account_id"], name: "index_orders_on_account_id", using: :btree
  add_index "orders", ["order_status_id"], name: "index_orders_on_order_status_id", using: :btree
  add_index "orders", ["service_agreement_id"], name: "index_orders_on_service_agreement_id", using: :btree
  add_index "orders", ["user_id"], name: "index_orders_on_user_id", using: :btree

  create_table "payment_arrangements", force: :cascade do |t|
    t.decimal  "initial_charge_amount",      precision: 12, scale: 3, default: 0.0, null: false
    t.decimal  "recurring_charge_amount",    precision: 12, scale: 3, default: 0.0, null: false
    t.text     "customer_initials"
    t.integer  "service_agreement_id"
    t.string   "payment_frequency"
    t.date     "start_date"
    t.datetime "created_at",                                                        null: false
    t.datetime "updated_at",                                                        null: false
    t.string   "payment_method_description"
  end

  add_index "payment_arrangements", ["service_agreement_id"], name: "index_payment_arrangements_on_service_agreement_id", using: :btree

  create_table "payment_methods", force: :cascade do |t|
    t.string   "card_number"
    t.string   "expiration"
    t.string   "cvc"
    t.string   "card_type"
    t.integer  "account_id"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
    t.integer  "service_agreement_id"
  end

  add_index "payment_methods", ["account_id"], name: "index_payment_methods_on_account_id", using: :btree

  create_table "pesticide_app_logs", force: :cascade do |t|
    t.string   "applicator_name"
    t.datetime "start_time"
    t.datetime "stop_time"
    t.string   "temperature"
    t.string   "wind_speed_direction"
    t.string   "pesticide_manufacturer"
    t.string   "trade_name"
    t.string   "epa_reg_formulation"
    t.string   "rate_product_dilutent_per_acre"
    t.string   "crop_or_site_and_crop_stage"
    t.string   "pests"
    t.string   "equipment_used"
    t.string   "acres_or_area_treated"
    t.string   "location_one"
    t.string   "location_two"
    t.text     "comments_map"
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
    t.integer  "account_id"
  end

  add_index "pesticide_app_logs", ["account_id"], name: "index_pesticide_app_logs_on_account_id", using: :btree

  create_table "pesticide_application_records", force: :cascade do |t|
    t.string   "applicator_name"
    t.datetime "start_time"
    t.datetime "stop_time"
    t.string   "temperature"
    t.string   "wind_speed_direction"
    t.string   "pesticide_manufacturer"
    t.string   "trade_name"
    t.string   "epa_reg_formulation"
    t.string   "rate_product_dilutent_per_acre"
    t.string   "crop_or_site_and_crop_stage"
    t.string   "pests"
    t.string   "equipment_used"
    t.string   "acres_or_area_treated"
    t.string   "location_one"
    t.string   "location_two"
    t.text     "comments_map"
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
    t.integer  "account_id"
  end

  add_index "pesticide_application_records", ["account_id"], name: "index_pesticide_application_records_on_account_id", using: :btree

  create_table "profiles", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "profiles", ["user_id"], name: "index_profiles_on_user_id", using: :btree

  create_table "service_agreement_additional_fees", force: :cascade do |t|
    t.string   "service_id"
    t.string   "service_agreement_id"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
    t.integer  "additional_fee_id"
  end

  create_table "service_agreements", force: :cascade do |t|
    t.text     "field_tech_signature"
    t.text     "customer_signature"
    t.text     "customers_initials_for_charges"
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
    t.text     "satisfaction_guarantee_initials"
    t.integer  "account_id"
    t.text     "credit_card_signature"
    t.boolean  "mice_and_rat_warranty"
    t.boolean  "scorpion"
    t.boolean  "cockroach"
    t.boolean  "bed_bugs"
    t.integer  "order_id"
    t.integer  "user_id"
    t.datetime "appointment_date_and_time"
  end

  add_index "service_agreements", ["account_id"], name: "index_service_agreements_on_account_id", using: :btree
  add_index "service_agreements", ["order_id"], name: "index_service_agreements_on_order_id", using: :btree
  add_index "service_agreements", ["user_id"], name: "index_service_agreements_on_user_id", using: :btree

  create_table "services", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.decimal  "price",                                precision: 12, scale: 3, default: 0.0, null: false
    t.datetime "created_at",                                                                  null: false
    t.datetime "updated_at",                                                                  null: false
    t.date     "part_of_service_agreement_start_date"
    t.date     "part_of_service_agreement_end_date"
    t.boolean  "active"
  end

  add_index "services", ["name"], name: "index_services_on_name", unique: true, using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "",    null: false
    t.string   "encrypted_password",     default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.boolean  "is_admin",               default: false
    t.boolean  "is_sales_rep",           default: false
    t.string   "first_name"
    t.string   "last_name"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  add_foreign_key "order_items", "orders"
  add_foreign_key "order_items", "services"
  add_foreign_key "orders", "accounts"
  add_foreign_key "orders", "order_statuses"
  add_foreign_key "orders", "service_agreements"
  add_foreign_key "orders", "users"
  add_foreign_key "payment_arrangements", "service_agreements"
  add_foreign_key "payment_methods", "accounts"
  add_foreign_key "pesticide_app_logs", "accounts"
  add_foreign_key "pesticide_application_records", "accounts"
  add_foreign_key "service_agreements", "accounts"
  add_foreign_key "service_agreements", "orders"
  add_foreign_key "service_agreements", "users"
end
