FactoryGirl.define do

  factory :user, class: User do |f|
    f.email 'test@example.com'
    f.password '321secret'
    # f.is_disabled false
    f.is_admin        false
    f.is_sales_rep    true
    # f.property_name 'Test Property'
    # f.sequence(:password_reset_token, 1000)  {|n| "#{random_number}#{n}c2vo9Gvy54kISg4Sg4c-nA"}
    # f.password_reset_sent_at recent
  end
end
