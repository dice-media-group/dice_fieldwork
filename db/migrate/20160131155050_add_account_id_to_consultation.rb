class AddAccountIdToConsultation < ActiveRecord::Migration
  def change
    add_column :consultations, :account_id, :integer
  end
end
