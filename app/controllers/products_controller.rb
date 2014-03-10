class ProductsController < ApplicationController
  def index
    @products = Product.all
  end

  def new
    @product = Product.new
  end

  def create
    product = Product.new(create_params)
    product.save
    redirect_to products_url
  end

  def edit
    @product = Product.find(product_id)
    render :new
  end

  private

  def create_params
    params.require(:product).permit(:name, :description, :price)
  end

  def product_id
    params.require(:id)
  end
end
