class Location < ActiveRecord::Base
  belongs_to :account
  has_many :notes, as: :notable, :inverse_of => :notable
  belongs_to :addressable, polymorphic: true, :inverse_of => :addresses
  
  
end
