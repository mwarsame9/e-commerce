class OrderItemsController < ApplicationController
  def index
    @order_items = OrderItem.all
  end

  def show
    @order_item = OrderItem.find(params[:id])
  end

  def new
    @order_item = OrderItem.new
  end

  def create
    @order_item = OrderItem.new(order_item_params)
    if @order_item.save
    flash[:notice] = "OrderItem successfully added!"
      redirect_to  order_items_path
    else
      render :new
    end
  end

  def edit
    @order_item = OrderItem.find(params[:id])
  end

  def update
    @order_item= OrderItem.find(params[:id])
    if @order_item.update(order_item_params)
      flash[:notice] = "OrderItem successfully updated!"
      redirect_to order_items_path
    else
      render :edit
    end
  end

  def destroy
    @order_item = OrderItem.find(params[:id])
    if @order_item.destroy
      flash[:notice] = "OrderItem successfully removed!"
      redirect_to order_items_path
    end
  end

private
  def order_item_params
    # Use strict parameters, replace placeholder info below with your class' actual attributes
    params.require(:order_item).permit(:attribute1, :attribute2, :attribute3)
  end
end
