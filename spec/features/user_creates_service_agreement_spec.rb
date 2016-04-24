require "rails_helper"

feature 'User creates service agreement' do
  let(:user) { create(:user) }
  let(:account) { create(:account)}
  # Create employee

  # Sign in user before each test!
  before :each do
    login_as user, scope: :user
  end

  scenario 'successfully' do
      visit account_path(account)
      expect(current_path).to eq("/accounts/#{account.id}")

      
      click_on "Create service agreement"
      expect(current_path).to eq(edit_service_agreement_path(account.service_agreements.last))
  end
end