class ServiceAgreement < ActiveRecord::Base
  belongs_to :account
  has_many :notes, as: :notable
end
