class ProductsController < ApplicationController
  def index
    @products = Product.all
  end

  def new
    @product = Product.new
  end

  def create
    product = Product.new(create_params)
    redirect_to products_url
  end

  def edit
    @product = Product.find(product_id)
    render :new
  end

  def update
    product = Product.find(product_id)
    product.update(update_params)
    redirect_to products_url
  end

  private

  def create_params
    params.require(:product).permit(:name, :description, :price)
  end

  def update_params
    params.require(:product).permit(:name, :description, :price)
  end

  def product_id
    params.require(:id)
  end
end
