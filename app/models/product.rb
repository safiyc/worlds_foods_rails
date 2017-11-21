class Product < ActiveRecord::Base
  has_many :reviews

  validates :name, :cost, :country_origin, :presence => true

  scope :three_recent_products, -> { order(created_at: :desc).limit(3)}
  scope :usa_products, -> { where(country_origin: "United States of America")}

  scope :most_reviews, -> {(
    select("products.id, products.name, products.cost, products.country_origin, count(reviews.id) as reviews_count")
    .joins(:reviews)
    .group("products.id")
    .order("reviews_count DESC")
    .limit(1)
    )}
end
