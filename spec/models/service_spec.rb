require 'rails_helper'

RSpec.describe Service, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"
  it "has a valid factory" do
    service = FactoryGirl.build(:service)
    expect(service).to be_valid
  end
  
  it 'does not allow creation of a service w/o a name' do
    expect { FactoryGirl.create(:service_with_blank_name) }.to raise_error(/Name can't be blank/)
  end

  it 'does not allow creation of a service w/o a price' do
    expect { FactoryGirl.create(:service_with_blank_price) }.to raise_error(/Price can't be blank/)
  end
  
end
