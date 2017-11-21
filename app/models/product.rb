class Product < ActiveRecord::Base
  has_many :reviews

  validates :name, :cost, :country_origin, :presence => true

  scope :three_recent_products, -> { order(created_at: :desc).limit(3)}
  scope :usa_products, -> { where(country_origin: "United States of America")}
end
