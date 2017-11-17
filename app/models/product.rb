class Product < ActiveRecord::Base
  validates :name, :cost, :country_origin, :presence => true
end
