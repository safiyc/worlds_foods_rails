class ReviewsController < ApplicationController
  def new
    @product = Product.find(params[:product_id])
    @review = @product.reviews.new
  end

  def create
    @product = Product.find(params[:product_id])
    @review = @product.reviews.new(review_params)
    if @review.save
      flash[:notice]= "Review successfully added"
      redirect_to product_path(@review.product)
    else
      flash[:alert]= "Review was not successfully added"
      render :new
    end
  end

  def edit
    @product = Product.find(params[:product_id])
    @review = Review.find(params[:id])
    render :edit
  end

  def update
    @product = Product.find(params[:product_id])
    @review = Review.find(params[:id])
    if @review.update(review_params)
      flash[:notice]= "Review successfully updated"
      redirect_to product_path(@review.product)
    else
      flash[:alert]= "Review was not successfully updated"
      render :edit
    end
  end

  def destroy
    @product = Product.find(params[:product_id])
    @review = Review.find(params[:id])
    @review.destroy
    flash[:notice]= "Review successfully deleted"
    redirect_to product_path(@review.product)
  end

  private
    def review_params
      params.require(:review).permit(:author, :content_body, :rating)
    end
end
