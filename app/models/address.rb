class Address < ActiveRecord::Base
  # belongs_to :location'
  belongs_to :addressable, polymorphic: true, :inverse_of => :addresses
  
end
