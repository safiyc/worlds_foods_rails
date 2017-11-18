class Review < ActiveRecord::Base
  belongs_to :product

  validates :author, :content_body, :rating, :presence => true

  validates_format_of :rating, :with => /[1-5]/, :on => :create
  validates_length_of :rating, :maximum => 1

end
