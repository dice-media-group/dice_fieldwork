class PaymentMethodsController < ApplicationController
  before_filter :load_parent

  def new
    @payment_method = @parent.payment_methods.new
  end
  
  def create
    @payment_methods = @parent.payment_methods.all
    @payment_method = @parent.payment_methods.create(payment_methods_params)
  end
  
  def update
  end
  
  private

  def load_parent
    klass = [Account].detect { |c| params["#{c.name.underscore}_id"]}
    @parent  = klass.find(params["#{klass.name.underscore}_id"])
  end
    def payment_methods_params
      params.require(:payment_method).permit(:card_number, :expiration, :cvc, :account_id, :service_agreement_id)
    end
  
end
