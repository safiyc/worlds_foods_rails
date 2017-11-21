class ToRemoveForeignKeys < ActiveRecord::Migration[5.1]
  def change
    remove_foreign_key :reviews, :products
  end
end
