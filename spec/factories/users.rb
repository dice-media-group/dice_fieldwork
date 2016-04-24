FactoryGirl.define do

  factory :user do
    epoch_seconds = DateTime.now.strftime('%s').to_i
    random_number = Random.rand(epoch_seconds)
    first_name {"FirstName_#{random_number}"}
    last_name {"LastName_#{random_number}"}
    sequence(:email) { |n| "user_#{n}_#{random_number}@factory.com" }
    
    
    password '321secret'
    # f.is_disabled false
    is_admin        false
    is_sales_rep    true
  end
end
