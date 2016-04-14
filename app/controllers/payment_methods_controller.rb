class PaymentMethodsController < ApplicationController
  before_filter :load_parent
  
  def create
    @payment_method = @parent.payment_methods.new(payment_methods_params)

    respond_to do |format|
      if @payment_method.save
        format.html { redirect_to new_account_service_agreement_path(@parent) }
        format.js
      else
        format.html { render action: 'new' }
      end
    end

  end
  
  private

  def load_parent
    klass = [Account, ServiceAgreement].detect { |c| params["#{c.name.underscore}_id"]}
    @parent  = klass.find(params["#{klass.name.underscore}_id"])
  end
    def payment_methods_params
      params.require(:payment_method).permit(:card_number, :expiration, :cvc)
    end
  
end
