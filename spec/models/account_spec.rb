require 'rails_helper'

RSpec.describe Account, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"
  it "has a valid factory" do
    account = FactoryGirl.build(:account)
    expect(account).to be_valid
  end
  

  # it 'is invalid with a duplicate email address' do
  #   account = FactoryGirl.create(:account)
  #   account2 = Account.create(first_name: "fred", last_name: "jones", email: account.email)
  #   contact.valid?
  #   expect
  # end
  
  it "is invalid without a firstname" do
    account = build(:account_with_blank_first_name)
    account.valid?
    expect(account.errors[:first_name]).to include("can't be blank")
  end

  it "is invalid without a lastname" do
    account = build(:account_with_blank_last_name)
    account.valid?
    expect(account.errors[:last_name]).to include("can't be blank")
  end

  it "is valid with a firstname, lastname and email" do
    expect { create(:account) }.not_to raise_error(/can't be blank/)
end

  it "is invalid without an email address" do
    
    account = build(:account_with_blank_email)
    account.valid?
    expect(account.errors[:email]).to include("can't be blank")
end

  it "is invalid with a duplicate email address" do
    create(:account, email: 'aaron@example.com')
    contact = build(:account, email: 'aaron@example.com')
    contact.valid?
    expect(contact.errors[:email]).to include('has already been taken')
  end

  it "returns a contact's full name as a string"
  #   PENDING "Not yet implemented"

end
