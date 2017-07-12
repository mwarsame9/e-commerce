class ReviewsController < ApplicationController

  def show
    @review = Review.find(params[:id])
    @product = @review.product
  end

  def new
    @product = Product.find(params[:product_id])
    @review = @product.reviews.new
  end

  def create
    @product = Product.find(params[:product_id])
    @review = @product.reviews.new(review_params)
    if @review.save
      flash[:notice] = "Review successfully added!"
      respond_to do |format|
        format.html { product_path(@review.product) }
        format.js
      end
    else
      render :new
    end
  end

  def edit
    @review = Review.find(params[:id])
    @product = @review.product
  end

  def update
    @review= Review.find(params[:id])
    if @review.update(review_params)
      flash[:notice] = "Review successfully updated!"
      redirect_to product_path(@review.product)
    else
      render :edit
    end
  end

  def destroy
    @product = Review.find(params[:id]).product
    if Review.find(params[:id]).destroy
      flash[:notice] = "Review successfully removed!"
      redirect_to product_path(@product)
    end
  end

private
  def review_params
    # Use strict parameters, replace placeholder info below with your class' actual attributes
    params.require(:review).permit(:author, :content, :product_id)
  end
end
