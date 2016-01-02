class Account < ActiveRecord::Base
  # has_many :addresses
  # has_many :notes, 
  has_many :notes, as: :notable, :inverse_of => :notable
end
