Product.destroy_all
Review.destroy_all

5.times do
  Product.create!(name: Faker::Food.ingredient, cost: Faker::Commerce.price, country_origin: Faker::Address.country)
end

# 20.times do
#   Review.create!(author: Faker::Name.name, content_body: Faker::Lorem.characters(150), rating: Faker::Number.between(1, 5), product_id: Faker::Number.number(1))
# end
