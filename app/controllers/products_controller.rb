class ProductsController < ApplicationController
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
