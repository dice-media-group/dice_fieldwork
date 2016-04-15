class OrdersController < ApplicationController
  before_filter :load_parent, only: [:new, :create, :index]
  
  def edit
  end

  def index
    @orders = @parent.orders.all
  end

  def new
  end

  def show
    @order                = Order.find(params[:id])
    current_order         = @order
    @agreement            = @order.service_agreement
    @services             = Service.all #Service.currently_offered_as_part_of_service_agreement(Date.today)
    @order_item           = @order.order_items.new
    gon.order             = @order
  end
  
  def update
    @order      = current_order
    @order.service_agreement_id = params[:order][:service_agreement_id]
    @order.account_id  = params[:order][:account_id]
    @agreement = @order.service_agreement

    respond_to do |format|
      if @order.save!
        format.html { redirect_to @agreement, notice: 'Order was successfully attached to the agreement.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @agreement.errors, status: :unprocessable_entity }
      end
    end
  end
  
  private
  def load_parent
    klass = [Account, ServiceAgreement].detect { |c| params["#{c.name.underscore}_id"]}
    @parent  = klass.find(params["#{klass.name.underscore}_id"])
  end

    # Never trust parameters from the scary internet, only allow the white
    # list through.
    def order_params
      params.require(:order).permit(:service_agreement_attributes => [:id], :account_attributes => [:id])
    end
  
end
