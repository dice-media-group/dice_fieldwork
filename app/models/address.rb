class Address < ActiveRecord::Base
  # belongs_to :location'
  belongs_to :addressable, polymorphic: true, :inverse_of => :addresses
  
  def postal
    "#{street_one}, #{street_two}, #{city}, #{state}, #{postal_code}"
  end
  
  def return_postal_format
    "#{street_one}, #{street_two}, #{city}, #{state}, #{postal_code}"
  end
  
  def self.service_locations
    where(is_billing: false)
  end
  
  def self.find_service_location(addresses)
    addresses         = Array(addresses.where(is_billing: false))
    if
      Array(addresses).count > 0
      address = addresses.first
    else
      address =  self.missing_address
    end
    return address
  end
  
  def self.billing_locations
    where(is_billing: true)
  end
  
  def self.find_billing_location(addresses)
    addresses         = Array(addresses.where(is_billing: true))
    if
      Array(addresses).count > 0
      address = addresses.first
    else
      address =  self.missing_address
    end
    return address
    
  end
  
  def self.missing_address
    OpenStruct.new(:street_one => "", 
            :street_two => "", 
            :city => "", 
            :state => "", 
            :postal_code => "")    
  end
end
