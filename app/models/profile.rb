class Profile < ActiveRecord::Base
  has_many :addresses, as: :addressable, :inverse_of => :addressable
  belongs_to :user
end
