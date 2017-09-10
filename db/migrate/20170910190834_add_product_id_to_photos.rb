class AddProductIdToPhotos < ActiveRecord::Migration
  def change
    add_reference :photos, :product, index: true, foreign_key: true
    add_column :photos, :image_data, :text
  end
end
