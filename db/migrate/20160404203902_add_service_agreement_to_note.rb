class AddServiceAgreementToNote < ActiveRecord::Migration
  def change
    add_reference :notes, :service_agreement, index: true, foreign_key: true
  end
end
