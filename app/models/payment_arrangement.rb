class PaymentArrangement < ActiveRecord::Base
  belongs_to :service_agreement
  
  def self.find_arrangement(payment_arrangements)
    payment_arrangements         = Array(payment_arrangements)
    if
      Array(payment_arrangements).count > 0
      payment_arrangement = payment_arrangements.first
    else
      payment_arrangement =  self.missing
    end
    return payment_arrangement
    
  end
  
  def self.missing
    OpenStruct.new(:initial_charge_amount => "0".to_d, 
            :recurring_charge_amount => "0".to_d, 
            :customer_initials => "", 
            :service_agreement_id => "", 
            :payment_frequency => "", 
            :start_date => "")    
  end
end
