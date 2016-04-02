class PaymentMethod < ActiveRecord::Base
  include ActiveModel::Validations
  
  belongs_to :account
  
  validates_each :card_number do |record, attr, value|
    is_valid_cc_number = CreditCard.new(value.to_s.delete(' ').delete('-')).valid?
    record.errors.add attr, 'invalid' if is_valid_cc_number == false
  end
  
  def self.missing_payment_method
    OpenStruct.new(:card_number => "",
    :expiration => "",
    :cvc => "",
    :card_type => ""
    )    
  end

  def self.mask_card_number(card_number)
    card_number.sub((part = card_number[0..-5]), '*' * part.length)
  end
  
  def self.find_payment_method(payment_methods)
    if
      Array(payment_methods).count > 0
      pm = payment_methods.first
    else
      pm =  self.missing_payment_method
    end
    return pm
    
  end
  
  def self.missing_payment_method
    OpenStruct.new(card_number: "", expiration: "", cvc: "", card_type: "")
  end
  
end
