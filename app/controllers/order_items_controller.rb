class Order_itemsController < ApplicationController
  def index
    @order_items = Order_item.all
  end

  def show
    @order_item = Order_item.find(params[:id])
  end

  def new
    @order_item = Order_item.new
  end

  def create
    @order_item = Order_item.new(order_item_params)
    if @order_item.save
    flash[:notice] = "Order_item successfully added!"
      redirect_to  order_items_path
    else
      render :new
    end
  end

  def edit
    @order_item = Order_item.find(params[:id])
  end

  def update
    @order_item= Order_item.find(params[:id])
    if @order_item.update(order_item_params)
      flash[:notice] = "Order_item successfully updated!"
      redirect_to order_items_path
    else
      render :edit
    end
  end

  def destroy
    @order_item = Order_item.find(params[:id])
    if @order_item.destroy
      flash[:notice] = "Order_item successfully removed!"
      redirect_to order_items_path
    end
  end

private
  def order_item_params
    # Use strict parameters, replace placeholder info below with your class' actual attributes
    params.require(:order_item).permit(:attribute1, :attribute2, :attribute3)
  end
end
