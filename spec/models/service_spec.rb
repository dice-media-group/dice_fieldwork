require 'rails_helper'

RSpec.describe Service, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"
  it "has a valid factory" do
    expect(build(:service)).to be_valid
  end

  describe '#name' do
    context 'when blank' do
      let(:service) { build(:service, name: '') }
      it "does not allow creation of a service w/o a name" do
        expect(service).to be_invalid
      end
    end

    context 'when duplicate name' do
      let(:first_service) { create(:service) }
      let(:service) { build(:service, name: first_service.name) }
      it "is not valid without a unique name" do
        expect(service).to be_invalid
      end
    end
    
  end

  describe '#price' do
    context 'when blank' do
      let(:service) { build(:service, price: '') }
      it "does not allow creation of a service w/o a price" do
        expect(service).to be_invalid
      end
    end

    context 'when negative' do
      let(:service) { build(:service, price: -1) }
      it 'cannot be less than 0' do
        expect(service).to be_invalid
      end
    end

    context 'when equal to zero' do
      let(:service) { build(:service, price: 0) }
      it 'cannot equal 0' do
        expect(service).to be_invalid
      end
    end

    context 'when positive' do
      let(:service) { build(:service, price: 0.01) }
      it 'must be greater than zero' do
        expect(service).to be_valid
      end
    end
  end
  
end
