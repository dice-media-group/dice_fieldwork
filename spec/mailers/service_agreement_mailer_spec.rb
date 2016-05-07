require "rails_helper"

RSpec.describe ServiceAgreementMailer, type: :mailer do
  describe "share_agreement" do
    let(:mail) { ServiceAgreementMailer.share_agreement }

    it "renders the headers" do
      expect(mail.subject).to eq("Share agreement")
      expect(mail.to).to eq(["to@example.org"])
      expect(mail.from).to eq(["from@example.com"])
    end

    it "renders the body" do
      expect(mail.body.encoded).to match("Hi")
    end
  end

end
