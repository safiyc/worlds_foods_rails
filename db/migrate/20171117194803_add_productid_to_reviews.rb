class AddProductidToReviews < ActiveRecord::Migration[5.1]
  def change
    add_reference :reviews, :product, index: true, foreign_key: true
  end
end
