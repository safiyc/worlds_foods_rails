class ToReplaceForeignKeys < ActiveRecord::Migration[5.1]
  def change
    remove_foreign_key :reviews, :products
    add_foreign_key :reviews, :products, on_delete: :cascade
  end
end
