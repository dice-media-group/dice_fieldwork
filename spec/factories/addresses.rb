FactoryGirl.define do
  factory :address, class: Address do |f|
    epoch_seconds = DateTime.now.strftime('%s').to_i
    random_number = Random.rand(epoch_seconds)
    f.street_one "StreetOne_#{random_number}"
    f.city "City_#{random_number}"
  end


end

