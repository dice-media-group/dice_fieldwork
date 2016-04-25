FactoryGirl.define do
  factory :account do
    epoch_seconds = DateTime.now.strftime('%s').to_i
    random_number = Random.rand(epoch_seconds)
    first_name {"FirstName_#{random_number}"}
    last_name {"LastName_#{random_number}"}
    sequence(:email) { |n| "user_#{n}_#{random_number}@factory.com" }
  end

  factory :account_with_blank_first_name, class: Account do |f|
    epoch_seconds = DateTime.now.strftime('%s').to_i
    random_number = Random.rand(epoch_seconds)
    f.first_name ""
    f.last_name "LastName_#{random_number}"
    f.email {"user_#{random_number}@factory.com" }
  end

  factory :account_with_blank_last_name, class: Account do |f|
    epoch_seconds = DateTime.now.strftime('%s').to_i
    random_number = Random.rand(epoch_seconds)
    f.first_name "FirstName_#{random_number}"
    f.last_name ""
    f.email {"user_#{random_number}@factory.com" }
  end

  factory :account_with_blank_email, class: Account do |f|
    epoch_seconds = DateTime.now.strftime('%s').to_i
    random_number = Random.rand(epoch_seconds)
    f.first_name "FirstName_#{random_number}"
    f.last_name "LastName_#{random_number}"
    f.email ""
  end

end

