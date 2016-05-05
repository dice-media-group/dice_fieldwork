class ServiceAgreementAdditionalFee < ActiveRecord::Base
  belongs_to :service_agreement
  belongs_to :additional_fee
end
