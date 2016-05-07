class ServiceAgreementMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.service_agreement_mailer.share_agreement.subject
  #
  def share_agreement(agreement)
    @agreement    = agreement

    mail  to: @agreement.account.email, 
          subject: "Thanks for your business.  Here's your service agreement."
  end
end
