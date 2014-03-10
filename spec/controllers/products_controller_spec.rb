require 'spec_helper'

describe ProductsController do
  describe '#create' do
    def do_request
      post :create, params
    end

    let(:params) { {product: {id: 0, name: 'Ruby book', description: 'It is a good book!', price: 12.99}} }

    it 'should save the product' do
      expect { do_request }.to change(Product, :count).by(1)
    end
  end
end
