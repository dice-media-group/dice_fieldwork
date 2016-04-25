FactoryGirl.define do
  factory :service_agreement do
    account
    user
    field_tech_signature "MyText"
    customer_signature "MyText"
    customers_initials_for_charges "MyText"
  end

end
