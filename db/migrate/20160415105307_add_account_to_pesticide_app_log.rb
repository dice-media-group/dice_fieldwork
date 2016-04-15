class AddAccountToPesticideAppLog < ActiveRecord::Migration
  def change
    add_reference :pesticide_app_logs, :account, index: true, foreign_key: true
  end
end
