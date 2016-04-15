class OrderItemsController < ApplicationController
  def create
    @order      = Order.find(params[:order_item][:order_id])
    @order_item = @order.order_items.new(order_item_params)
    @order_item.save
  end

  def update
    @order = Order.find(params[:order_item][:order_id])
    @order_item = @order.order_items.find(params[:id])
    @order_item.update_attributes(order_item_params)
    @order_items = @order.order_items
  end

  def destroy
    @order_item     = OrderItem.find(params[:id])
    @order          = @order_item.order
    @service_id     = @order_item.service_id
    @order_item.destroy
  end
private

  def order_item_params
    params.require(:order_item).permit(:quantity, :service_id)
  end
end
