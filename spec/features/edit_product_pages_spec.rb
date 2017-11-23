require 'rails_helper'

describe "the edit a product process" do
  it "edits a product" do
    product = Product.create(name: "Black Tea", cost: 6, country_origin: "China")
    visit product_path(product)
    click_link "Edit"
    fill_in "Name", :with => "Green Tea"
    fill_in "Cost", :with => 6
    fill_in "Country origin", :with => "China"
    click_on "submit"
    expect(page).to have_content "Green Tea"
  end

  it "disables submit button on blank fields" do
    visit new_product_path
    click_on "submit"
    expect(page).to have_content "submit"
  end
end
