# Preview all emails at http://localhost:3000/rails/mailers/service_agreement_mailer
class ServiceAgreementMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/service_agreement_mailer/share_agreement
  def share_agreement
    agreement = ServiceAgreement.last
    ServiceAgreementMailer.share_agreement(agreement)
  end

end
