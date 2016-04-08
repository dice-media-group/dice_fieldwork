class OrdersController < ApplicationController
  
  def edit
  end

  def index
  end

  def new
  end

  def show
  end
  
  def update
    @order    = Order.find(session[:order_id])
    @agreement = ServiceAgreement.find(params[:id])
    @order.service_agreement = @agreement if @agreement
    @order.account           = @account   if @account

    respond_to do |format|
      if @order.update_attributes(order_params)
        format.html { redirect_to @agreement, notice: 'Order was successfully attached to the agreement.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @agreement.errors, status: :unprocessable_entity }
      end
    end
  end
  
  private
    # Never trust parameters from the scary internet, only allow the white
    # list through.
    def order_params
      params.require(:order).permit(:service_agreement_attributes => [:id], :account_attributes => [:id])
    end
  
end
