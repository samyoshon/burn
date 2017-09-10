class AddProductIdToImages < ActiveRecord::Migration
  def change
    add_reference :images, :product, index: true, foreign_key: true
    add_column :images, :image_data, :text
    remove_column :products, :image_data
  end
end
