class ServiceAgreementsController < ApplicationController
  authorize_resource :except => [:show]

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
    @service_agreement = @account.service_agreements.new
    @service_agreement.orders.new
    
    @service_address  = @account.addresses.all.find_service_location(@account.addresses)
    @billing_address  = @account.addresses.all.find_billing_location(@account.addresses)
    @services             = Service.currently_offered_as_part_of_service_agreement(Date.today)
    @payment_method   = PaymentMethod.find_payment_method(@account.payment_methods)
    
    @new_account_address  = @account.addresses.new
    @new_payment_method   = @account.payment_methods.build
    @address = Address.new(:addressable => @account)
    
    
  end

  def edit
    @agreement              = ServiceAgreement.find(params[:id])
    @account                = @agreement.account
    gon.current_agreement   = @agreement
    initial_date            = Date.today
    @services               = Service.currently_offered_as_part_of_service_agreement(Date.today)
    @order                  = @agreement.orders.last
    @billing_address        = @agreement.addresses.all.find_billing_location(@agreement.addresses)
    @service_address        = @agreement.addresses.all.find_service_location(@agreement.addresses)
    @payment_method         = PaymentMethod.find_payment_method(@agreement.payment_methods)
    @arrangement            = @agreement.payment_arrangements.last
    # @new_account            = @agreement.account.new
    @new_agreement_billing_address = @agreement.addresses.new(is_billing: true)
    @new_agreement_service_address = @agreement.addresses.new(is_billing: false)
    @new_payment_method            = @agreement.payment_methods.build
    @new_payment_arrangement       = @agreement.payment_arrangements.build
  end

  def show
    @agreement        = ServiceAgreement.find(params[:id])
    @account          = @agreement.account
    @order            = @agreement.orders.last
    @billing_address  = @agreement.addresses.all.find_billing_location(@agreement.addresses)
    @service_address  = @agreement.addresses.all.find_service_location(@agreement.addresses)
    @payment_method   = PaymentMethod.find_payment_method(@agreement.payment_methods)
    @arrangement            = @agreement.payment_arrangements.last
    # @order_items      = @order.order_items
    
  end

  def create
    @agreement  = current_user.service_agreements.new agreement_params
    @agreement.account_id = params[:account_id].to_i if params[:account_id]
    
      if @agreement.save
        @order = @agreement.orders.create!(user_id: current_user.id)
        
        redirect_to edit_service_agreement_path(@agreement),
          notice: 'Service Agreement is ready to start.'
      else
        render action: 'new'
      end
  end

  def update
    # creates or updates the relationships of the order that belongs to the service agreement
    @agreement = ServiceAgreement.find(params[:id])
    order = @agreement.orders.last
    order.account = @agreement.account
    order.save!
    session.delete[:order_id] if session[:order_id]
    respond_to do |format|
      if @agreement.update_attributes(agreement_params)
        #send email 
        # Tell the ServiceAgreementMailer to send a copy of the updated service agreement to the account
        mail = ServiceAgreementMailer.share_agreement(@agreement)
                
        format.html { redirect_to @agreement, notice: 'Agreement was successfully initiated.' }
      else
        format.html { render action: 'edit' }
        format.json { render json: @cart.errors, status: :unprocessable_entity }
      end
    end
  end

  def current_order_item(service)
    current_order.order_items.where(service: service)
  end
  
  private
    # Never trust parameters from the scary internet, only allow the white
    # list through.
    def agreement_params
      params.require(:service_agreement).permit(:credit_card_signature, 
      :field_tech_signature, :field_rep, :customer_signature,:customers_initials_for_charges, 
      :satisfaction_guarantee_initials, :account_id,  additional_fee_ids:[]) if params[:service_agreement]
        # ,
        # :credit_card_signature, :notes => [:content], order_attributes: [:pay_type])
    end
  
end
