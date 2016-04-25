require "rails_helper"

feature 'User completes service agreement' do
  let(:user) { create(:user) }
  let(:order) { create(:order, pay_type: "visa", :service_agreement => create(:service_agreement), :account => create(:account)) }
  let(:agreement) { order.service_agreement }
  
  # let(:agreement) {create(:service_agreement, :account => create(:account))}

  # Sign in user before each test!
  before :each do
    login_as user, scope: :user
  end

  scenario 'successfully' do
      visit edit_service_agreement_path(agreement)
      expect(current_path).to eq("something")

      #
      # click_on "Create service agreement"
      # expect(current_path).to eq(edit_service_agreement_path(account.service_agreements.last))
  end
end