require 'rails_helper'

describe "the delete a product process" do
  it "deletes a product" do
    product = Product.create(name: "Black Tea", cost: 6, country_origin: "China")
    visit product_path(product)
    click_link "Delete"
    visit products_path
    expect(page).to have_no_content("Black Tea")
  end
end
