require 'rails_helper'

RSpec.describe Account, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"
  

  it "has a valid factory" do
    expect(build(:account)).to be_valid
  end

  describe '#first_name' do
    
    context 'when blank' do
      let(:account) { build(:account, first_name: '') }
      it "is invalid" do
        expect(account).to be_invalid
      end
    end
  end
  describe '#last_name' do
    context 'when is blank' do
      let(:account) { build(:account, last_name: '') }
      it "is invalid" do
        expect(account).to be_invalid
      end
    end
  end

  describe '#email' do
    context 'when is blank' do
      let(:account) { build(:account, email: '') }
      it "is invalid" do
        expect(account).to be_invalid
      end
    end      
    context 'when it is a duplicate address' do
      let(:account_with_same_email) { build(:account, email: 'aaron@example.com') }
      it "is invalid" do
        create(:account, email: 'aaron@example.com')
        expect(account_with_same_email).to be_invalid
      end
    end
  end


  it "returns a contact's full name as a string"
  #   PENDING "Not yet implemented"

end
