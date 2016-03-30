class AddReferralSourceToAccount < ActiveRecord::Migration
  def change
    add_column :accounts, :referral_source, :string
  end
end
