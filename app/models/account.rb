class Account < ActiveRecord::Base
  has_many :notes, as: :notable, :inverse_of => :notable
  has_many :addresses, as: :addressable, :inverse_of => :addressable
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true, uniqueness: true

  has_many :consultations
  has_many :users, :through => :consultations
  has_many :service_agreements, dependent: :destroy
  has_many :payment_methods, dependent: :destroy
  has_many :pesticide_application_records
  def name
    "#{last_name}, #{first_name}"
  end
  
  def local_genesis
    "#{created_at.to_formatted_s(:short)}"
  end

  def return_service_location(account_id)
    service_location = GeoLocation.find_service_location(account_id)
  end
  
  def return_billing_location(account_id)
    billing_location = GeoLocation.find_billing_location(account_id)
  end
end
