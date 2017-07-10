class OrdersController < ApplicationController
  def index
    @orders = Order.all
  end

  def show
    @order = Order.find(params[:id])
  end

  def new
    @order = Order.new
  end

  def create
    @order = Order.new(order_params)
    if @order.save
    flash[:notice] = "Order successfully added!"
      redirect_to  orders_path
    else
      render :new
    end
  end

  def edit
    @order = Order.find(params[:id])
  end

  def update
    @order= Order.find(params[:id])
    if @order.update(order_params)
      flash[:notice] = "Order successfully updated!"
      redirect_to orders_path
    else
      render :edit
    end
  end

  def destroy
    @order = Order.find(params[:id])
    if @order.destroy
      flash[:notice] = "Order successfully removed!"
      redirect_to orders_path
    end
  end

private
  def order_params
    # Use strict parameters, replace placeholder info below with your class' actual attributes
    params.require(:order).permit(:attribute1, :attribute2, :attribute3)
  end
end
