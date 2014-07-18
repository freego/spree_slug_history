require 'spec_helper'

feature 'Slug History' do
  let!(:product) { create(:product, name: 'first slug') }

  scenario 'current slug respond with product' do
    visit spree.product_path('first-slug')
    page.should have_content(product.name)
  end

  scenario 'old slug redirect to new slug' do
    product.slug = 'new slug'
    product.save

    visit spree.product_path('first-slug')
    current_path.should == '/products/new-slug'
    page.should have_content(product.name)
  end
end