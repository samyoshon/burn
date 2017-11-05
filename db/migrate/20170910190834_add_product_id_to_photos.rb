class AddCategoryIdToProducts < ActiveRecord::Migration[4.2]
  def change
    add_reference :products, :category, index: true, foreign_key: true
    add_reference :products, :market, index: true, foreign_key: true
    add_reference :products, :user, index: true, foreign_key: true
  end
end
