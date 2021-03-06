require 'spec_helper'

describe 'Manage Product Workflow', js: true do
  it 'allows user to CRUD a product' do
    visit '/products'
    click_on 'Create Product'
    page.should have_content 'Description'

    fill_in 'Name',        with: 'Ruby Book #2'
    fill_in 'Description', with: 'It is a good book!'
    fill_in 'Price',       with: '12.99'
    click_on 'Submit'

    page.should have_content 'Ruby Book #2'

    click_on 'Update Product'
    fill_in 'Name',        with: 'Ruby Book #3'
    click_on 'Submit'

    page.should have_content 'Ruby Book #3'
  end
end
