class GeoLocation
  def self.find_service_location(account_id)
    service_location = Account.find(account_id).addresses.where(is_billing: false).first || DefaultAddress.new
  end

  def self.find_billing_location(account_id)
    billing_location = Account.find(account_id).addresses.where(is_billing: true).first || DefaultAddress.new
  end

end