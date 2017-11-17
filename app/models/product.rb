class Product < ActiveRecord::Base
  has_many :reviews

  validates :name, :cost, :country_origin, :presence => true
end
