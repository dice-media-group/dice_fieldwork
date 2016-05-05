class ServiceAgreement < ActiveRecord::Base
  belongs_to :account
  has_many :notes, as: :notable
  
  has_many :orders
  accepts_nested_attributes_for :orders
  
  belongs_to :user
  validates_associated :orders
  
  has_many :addresses
  has_many :payment_methods
  has_many :payment_arrangements
  
  accepts_nested_attributes_for :payment_arrangements
  
  #current workaround
  has_and_belongs_to_many :additonal_fees
  # accepts_nested_attributes_for :service_agreement_additional_fee, allow_destroy: true
  
  # has_many :additonal_fees, :through => :service_agreement_addtional_fee
  
  def addl_fee_ids
    # AdditionalFee.order(:id).map(&:id) # All of the additional fees
    []
  end
  
end
