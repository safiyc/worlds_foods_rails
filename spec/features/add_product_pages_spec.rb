require 'rails_helper'

describe "the add a product process" do
  it "adds a new product" do
    visit products_path
    click_link "Add Product"
    fill_in "Name", :with => "Green Tea"
    fill_in "Cost", :with => 6
    fill_in "Country origin", :with => "China"
    click_on "submit"
    expect(page).to have_content "Green Tea"
  end
end
