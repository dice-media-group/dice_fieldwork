class AddressesController < ApplicationController
  before_filter :load_addressable

  def new
    @address = @addressable.addresses.new

  end
  def create
    @addresses = Address.all
    @address = Address.create(address_params)

  end
  
  def update
  end
  
  private

  def load_addressable
    klass = [Account, ServiceAgreement].detect { |c| params["#{c.name.underscore}_id"]}
    @addressable  = klass.find(params["#{klass.name.underscore}_id"])
  end
    def address_params
      params.require(:address).permit(:street_one, :street_two, :city, :state, :postal_code, :is_billing, :service_agreement_id, :account_id)
    end
  
end
