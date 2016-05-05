class AdditionalFee < ActiveRecord::Base
  has_and_belongs_to_many :service_agreements
  # has_many :service_agreements, :through => :service_agreement_additional_fee
  
  def name_and_price
    "#{self.name}  $#{self.price}"
  end
  
end
