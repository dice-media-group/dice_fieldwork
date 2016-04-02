class ServiceAgreementsController < ApplicationController

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
  end

  def edit
  end

  def show
    @agreement = ServiceAgreement.find(params[:id])
  end

  def create
    @account    = Account.find(params[:account_id])
    @agreement = @account.service_agreements.new(agreement_params)

    respond_to do |format|
      if @agreement.save
        format.html { redirect_to [@agreement],
          notice: 'Service agreement was successfully created.' }
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
  end
  
  private
    # Never trust parameters from the scary internet, only allow the white
    # list through.
    def agreement_params
      params.require(:service_agreement).permit(:field_tech_signature,
        :customer_signature,
        :customers_initials_for_charges,
        :satisfaction_guarantee_initials,
        :account_id,
        :credit_card_signature,
        :scorpion
      )
    end
  
end
