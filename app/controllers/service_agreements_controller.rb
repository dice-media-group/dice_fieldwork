class ServiceAgreementsController < ApplicationController
  authorize_resource

  # GET /services
  # GET /services.json
  def index
    @account = Account.find(params[:account_id])
    @agreements = ServiceAgreement.all
    respond_to do |format|
      format.html
      format.xml
    end
  end

  def new
    # render layout: false
    
    @account = Account.find(params[:account_id])
    @service_agreement = @account.service_agreements.build
    @service_address  = Address.find_service_location(@account.addresses)
    @services             = Service.currently_offered_as_part_of_service_agreement(Date.today)
    
  end

  def edit
    @agreement            = ServiceAgreement.find(params[:id])
    gon.current_agreement = @agreement
    initial_date          = Date.today
    @services             = Service.currently_offered_as_part_of_service_agreement(Date.today)
    @order_item           = current_order.order_items.new
    @order                = current_order
    
  end

  def show
    @agreement        = ServiceAgreement.find(params[:id])
    @account          = @agreement.account
    @order            = @agreement.orders.last
    @billing_address  = @account.addresses.all.find_billing_location(@account.addresses)
    @service_address  = @account.addresses.all.find_service_location(@account.addresses)
    @payment_method   = PaymentMethod.find_payment_method(@account.payment_methods)
    @order_items      = @order.order_items
    
  end

  def create
    @account    = Account.find(params[:account_id])
    @agreement = @account.service_agreements.new(agreement_params)

    respond_to do |format|
      if @agreement.save
        session.delete(:order_id) if session[:order_id]
        format.html { redirect_to edit_service_agreement_path(@agreement),
          notice: 'Service agreement details were successfully created.' }
        format.json { render action: 'show', status: :created,
          location: @agreement }
      else
        format.html { render action: 'new' }
        format.json { render json: @agreement.errors,
          status: :unprocessable_entity }
      end
    end
  end

  def update
    # creates or updates the relationships of the order that belongs to the service agreement
    @agreement = ServiceAgreement.find(params[:id])
    order = current_order
    order.service_agreement = @agreement
    order.account = @agreement.account
    order.save!
    session.delete[:order_id] if session[:order_id]
    format.html { redirect_to edit_service_agreement_path(@agreement),
      notice: 'Order attached to service agreement and account.' }
    
  end

  def current_order_item(service)
    current_order.order_items.where(service: service)
  end
  
  private
    # Never trust parameters from the scary internet, only allow the white
    # list through.
    def agreement_params
      params.require(:service_agreement).permit(:field_tech_signature, :customer_signature, :customers_initials_for_charges, :satisfaction_guarantee_initials, :account_id, :credit_card_signature, :order_id, :notes => [:content])
    end
  
end
