require 'spec_helper'

describe 'Create Product Workflow' do
  it 'allows user to create a product' do
    visit '/products/new'
    page.should have_content 'Description'

    fill_in 'Name',        with: 'Ruby Book'
    fill_in 'Description', with: 'It is a good book!'
    fill_in 'Price',       with: '12.99'
    click_on 'Submit'

    page.should have_content 'Success'
  end
end
