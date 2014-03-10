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
    render text: 'Success'
  end

  private

  def create_params
    params.require(:product).permit(:name, :description, :price)
  end
end
