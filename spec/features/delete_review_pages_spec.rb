require 'rails_helper'

describe "the edit a review process" do
  it "edits a review" do
    product = Product.create!(name: "Black Tea", cost: 6, country_origin: "China")
    review = product.reviews.create!(author: "John S", content_body: "This paragraph is more than 50 characters. This paragraph is not long", rating: 5)
    visit product_path(product)
    click_link "delete"

    expect(page).to have_no_content "John S"
  end
end
