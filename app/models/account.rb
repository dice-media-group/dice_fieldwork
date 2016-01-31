class Account < ActiveRecord::Base
  has_many :notes, as: :notable, :inverse_of => :notable
  has_many :addresses, as: :addressable, :inverse_of => :addressable
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true, uniqueness: true

  has_many :consultations
  has_many :users, :through => :consultations
  
end
