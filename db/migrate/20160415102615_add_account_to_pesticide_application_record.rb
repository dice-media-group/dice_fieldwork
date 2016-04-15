class AddAccountToPesticideApplicationRecord < ActiveRecord::Migration
  def change
    add_reference :pesticide_application_records, :account, index: true, foreign_key: true
  end
end
