require 'rails_helper'

RSpec.describe Address, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"
  

  it "has a valid factory" do
    expect(build(:address)).to be_valid
  end

  describe '#return_postal_format' do

    context 'when street_one.length >= 3' do
      let(:address) { build(:address, street_one: '1223 forest drive') }
      let(:expected) { 3 }
      it "has a length of >= 3" do
        expect(address.return_postal_format.length).to be >= expected
      end
    end
    
    context 'when not blank' do
      let(:address) { build(:address) }
      let(:actual) { address.return_postal_format }
      let(:expected) { String }
      it 'returns a string' do
        expect(actual).to be_kind_of(expected)
      end
    end

    it "returns full postal address as a string"
    #   PENDING "Not yet implemented"
    
  end

end
