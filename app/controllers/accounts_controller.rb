class AccountsController < ApplicationController
  before_action :set_account, only: [:show, :edit, :update, :destroy]
  load_and_authorize_resource
  
  # GET /accounts
  # GET /accounts.json
  def index
    @accounts = Account.all
    respond_to do |format|
      format.html
      format.xml
    end
  end

  # GET /accounts/1
  # GET /accounts/1.json
  def show
    @agreement = @account.service_agreements.first
  end

  # GET /accounts/new
  def new
    @account = Account.new
  end

  # GET /accounts/1/edit
  def edit
  end

  # POST /accounts
  # POST /accounts.json
  def create
    @accounts = Account.all
    @account = Account.create(account_params)
    
    if @account.save!
      agreement_id = params[:agreement_id].to_i
      
      if agreement_id > 0 # the agreement_id will be 0 if there is no agreement
        agreement     = ServiceAgreement.find(agreement_id)
        agreement.account_id = @account.id
        agreement.save!
      end

      respond_to do |format|
        format.js
        format.html { redirect_to @account,
          notice: 'Account was successfully created.' }
        format.json { head :no_content }
      end
    end
  end

  # PATCH/PUT /accounts/1
  # PATCH/PUT /accounts/1.json
  def update
    respond_to do |format|
      if @account.update(account_params)
        format.html { redirect_to @account,
          notice: 'Account was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @account.errors,
          status: :unprocessable_entity }
      end
    end
  end

  # DELETE /accounts/1
  # DELETE /accounts/1.json
  def destroy
    @account.destroy
    respond_to do |format|
      format.html { redirect_to accounts_url }
      format.json { head :no_content }
    end
  end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_account
        @account = Account.find(params[:id])
      end

      # Never trust parameters from the scary internet, only allow the white
      # list through.
      def account_params
        params.require(:account).permit(:first_name,
                :last_name, 
                :email, 
                :no_customer_email_address, 
                :primary_phone_number, 
                :secondary_phone_number,
                :is_business, 
                :company_name, 
                :mobile_phone, 
                :fax, 
                :referral_source,
                :service_agreement_id)
      end

end

