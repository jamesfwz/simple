require 'spec_helper'

describe ProductsController do
  describe '#create' do
    def do_request
      post :create, params
    end

    let(:params) { {product: attributes_for(:product)} }

    it 'should save the product' do
      expect { do_request }.to change(Product, :count).by(1)
      response.should redirect_to products_url
    end
  end

  describe '#new' do
    def do_request
      get :new
    end

    it 'should display the product form' do
      do_request
      response.should render_template :new
    end
  end

  describe '#index' do
    def do_request
      get :index
    end

    let!(:product) { create_list(:product, 2) }

    it 'should display a list of products' do
      do_request
      assigns(:products).size.should == 2
      response.should render_template :index
    end
  end

  describe '#edit' do
    def do_request
      get :edit, id: product.id
    end

    let!(:product) { create(:product) }

    it 'should display the edit form' do
      do_request
      assigns(:product).id.should == product.id
      response.should render_template :new
    end
  end
end
