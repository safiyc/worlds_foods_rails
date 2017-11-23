Product.destroy_all
Review.destroy_all

50.times do |index|
  product = Product.create!(name: Faker::Food.ingredient, cost: Faker::Commerce.price, country_origin: Faker::Address.country)

  5.times do |index|
    Review.create!(author: Faker::Name.name, content_body: Faker::Lorem.paragraph(3, true, 2), rating: Faker::Number.between(1, 5), product_id: product.id)
  end
end
