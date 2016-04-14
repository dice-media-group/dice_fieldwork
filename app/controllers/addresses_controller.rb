class AddressesController < ApplicationController
  before_filter :load_addressable

  def create
    @address = @addressable.addresses.new(address_params)

    respond_to do |format|
      if @address.save
        format.html { redirect_to new_account_service_agreement_path(@addressable) }
        format.js
      else
        format.html { render action: 'new' }
      end
    end

  end
  
  def update
  end
  
  private

  def load_addressable
    klass = [Account, ServiceAgreement].detect { |c| params["#{c.name.underscore}_id"]}
    @addressable  = klass.find(params["#{klass.name.underscore}_id"])
  end
    def address_params
      params.require(:address).permit(:street_one, :street_two, :city, :state, :postal_code, :is_billing)
    end
  
end
