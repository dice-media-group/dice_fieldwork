class Location < ActiveRecord::Base
  belongs_to :account
  has_many :notes, as: :notable, :inverse_of => :notable
  has_many :addresses, as: :addressable, :inverse_of => :addressable
end
