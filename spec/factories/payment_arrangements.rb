FactoryGirl.define do
  factory :payment_arrangement do
    initial_charge_amount "9.99"
recurring_charge_amount "9.99"
customer_initials "MyText"
service_agreement nil
payment_frequency "MyString"
start_date "2016-04-26"
  end

end
