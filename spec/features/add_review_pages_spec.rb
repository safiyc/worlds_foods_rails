require 'rails_helper'

describe "the add a review process" do
  it "adds a new review" do
    product = Product.create!(name: "Black Tea", cost: 6, country_origin: "China")
    visit product_path(product)
    click_link "Add Review"
    fill_in "Author", :with => "John S"
    fill_in "Content body", :with => "This paragraph is not long. This paragraph is not long"
    fill_in "Rating", :with => 5
    click_on "submit"
    expect(page).to have_content "John S"
  end

  it "disables submit button on blank fields" do
    product = Product.create!(name: "Black Tea", cost: 6, country_origin: "China")
    visit product_path(product)
    click_link "Add Review"
    click_on "submit"
    expect(page).to have_content "submit"
  end
end
