require 'rails_helper'

describe "the edit a review process" do
  it "edits a review" do
    product = Product.create!(name: "Black Tea", cost: 6, country_origin: "China")
    review = product.reviews.create!(author: "John S", content_body: "This paragraph is more than 50 characters. This paragraph is not long", rating: 5)
    visit product_path(product)
    click_link "edit"
    fill_in "Author", :with => "edited John S"
    fill_in "Content body", :with => "edited This paragraph is not long. This paragraph is not long"
    fill_in "Rating", :with => 5
    click_on "submit"
    expect(page).to have_content "edited John S"
  end

  it "disables submit buttton on blank fields" do
    product = Product.create!(name: "Black Tea", cost: 6, country_origin: "China")
    review = product.reviews.create!(author: "John S", content_body: "This paragraph is more than 50 characters. This paragraph is not long", rating: 5)
    visit product_path(product)
    click_link "edit"
    fill_in "Author", :with => ""
    fill_in "Content body", :with => "edited This paragraph is not long. This paragraph is not long"
    fill_in "Rating", :with => 5
    click_on "submit"
    expect(page).to have_content "submit"
  end
end
