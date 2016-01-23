FactoryGirl.define do

  factory :user, class: User do |f|
    epoch_seconds = DateTime.now.strftime('%s').to_i
    random_number = Random.rand(epoch_seconds)
    recent = 1.minute.ago
    f.email {"user_#{rand(epoch_seconds).to_s}@factory.com" }
    f.password 'secret'
    f.is_disabled false
    f.is_admin    false
    f.property_name 'Test Property'
    f.sequence(:password_reset_token, 1000)  {|n| "#{random_number}#{n}c2vo9Gvy54kISg4Sg4c-nA"}
    f.password_reset_sent_at recent
  end
end
