class Review < ActiveRecord::Base
  belongs_to :product

  validates :author, :content_body, :rating, :presence => true
  validates_format_of :rating, :with => /[1-5]/, :on => :create, :message => 'must be a number between 1 and 5'
  validates_length_of :rating, :maximum => 1
  validates :content_body, length: { minimum: 50, maximum: 250 }

  

end
