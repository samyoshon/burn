class AddImageToProducts < ActiveRecord::Migration[4.2]
  def change
  	add_column :products, :image_data, :text
  	add_column :forum_posts, :image_data, :text
  	add_column :forum_threads, :image_data, :text
  	add_column :users, :image_data, :text
  	add_column :markets, :image_data, :text
  end
end
