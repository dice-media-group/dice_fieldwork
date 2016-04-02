class Address < ActiveRecord::Base
  # belongs_to :location'
  belongs_to :addressable, polymorphic: true, :inverse_of => :addresses
  
  def postal
    "#{street_one}, #{street_two}, #{city}, #{state}, #{postal_code}"
  end
  
  def return_postal_format
    "#{street_one}, #{street_two}, #{city}, #{state}, #{postal_code}"
  end
  
  def find_service_location
    addr      = addresses.where(is_billing: false).first
    # svc_loc   =
    # .city.to_s# .street_one.to_s
    # "#{addr.street_one}" #", #{addr.street_two,} #{addr.city}, #{addr.state}  #{addr.postal_code}"
  end
  
  def find_first_billing_location
    
  end
end
