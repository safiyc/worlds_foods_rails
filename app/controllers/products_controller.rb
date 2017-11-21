class ProductsController < ApplicationController
  def index
    @products = Product.all
    @three_recent_products = Product.three_recent_products
    @usa_products = Product.usa_products
    @most_reviews = Product.most_reviews
    render :index
  end

  def show
    @product = Product.find(params[:id])
    render :show
  end

  def new
    @product = Product.new
    render :new
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      flash[:notice] = "Product successfully added"
      redirect_to products_path
    else
      flash[:alert]= "Product was not created successfully"
      render :new
    end
  end

  def edit
    @product = Product.find(params[:id])
    render :edit
  end

  def update
    @product = Product.find(params[:id])
    if @product.update(product_params)
      flash[:notice] = "Product successfully updated"
      redirect_to products_path
    else
      flash[:alert]= "Product was not updated successfully"
      render :edit
    end
  end

  def destroy
    @product = Product.find(params[:id])
    @product.destroy
    flash[:notice] = "Product successfully deleted"
    redirect_to products_path
  end

  private
    def product_params
      params.require(:product).permit(:name, :cost, :country_origin)
    end
end
