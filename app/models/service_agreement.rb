class ServiceAgreement < ActiveRecord::Base
  belongs_to :account
  has_many :notes, as: :notable
  
  has_many :orders
  accepts_nested_attributes_for :orders
  
  belongs_to :user
  validates_associated :orders
end
