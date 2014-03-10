class ProductsController < ApplicationController
  def create
    product = Product.new(create_params)
    product.save
    render text: ''
  end

  private

  def create_params
    params.require(:product).permit(:name, :description, :price)
  end
end
