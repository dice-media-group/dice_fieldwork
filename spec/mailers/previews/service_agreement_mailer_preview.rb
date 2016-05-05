# Preview all emails at http://localhost:3000/rails/mailers/service_agreement_mailer
class ServiceAgreementMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/service_agreement_mailer/new_appointment
  def new_appointment
    agreement = ServiceAgreement.last
    ServiceAgreementMailer.new_appointment(agreement)
  end

end
