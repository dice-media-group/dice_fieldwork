FactoryGirl.define do
  factory :cart, class: Cart do |f|
    
    f.created_at Time.now
  end

end
