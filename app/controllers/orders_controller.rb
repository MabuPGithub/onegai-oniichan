class OrdersController < ApplicationController
  def index
  end

  def show
  end

  def new
  end

  def create
    @order = Order.new(order_params)
      if @order.save
        flash[:notice] = "Order has been successfully placed!"
        redirect_to "/in-stock"
      else
        render order_nendo_path
      end
  end

  private
  def order_params
    params.permit(:nendoroid_id, :nendoroid_name, :total_price, :deposit, :status, :reason, :user_id)
  end
end
