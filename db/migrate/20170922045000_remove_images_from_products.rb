class RemoveImagesFromProducts < ActiveRecord::Migration[4.2]
  def change
  	remove_column :products, :images
  	remove_column :users, :image_data
  	remove_column :forum_posts, :image_data
  	add_column :products, :image, :string, array: true, default: [] # add images column as array
  	add_column	:users, :image, :text
  	add_column	:forum_posts, :image, :string, array: true, default: [] # add images column as array
  	drop_table :images
  	drop_table :photos
  end
end
