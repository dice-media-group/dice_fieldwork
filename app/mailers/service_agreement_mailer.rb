class ServiceAgreementMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.service_agreement_mailer.new_appointment.subject
  #
  def new_appointment(agreement)
    @agreement    = agreement

    mail  to: @agreement.account.email, 
          subject: "Service agreement and next appointment"
  end
end
