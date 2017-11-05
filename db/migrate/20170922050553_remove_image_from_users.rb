class RemoveImageFromUsers < ActiveRecord::Migration[4.2]
  def change
  	remove_column :products, :image
  	remove_column :users, :image
  	remove_column :forum_posts, :image
  	add_column :products, :images, :text, array: true, default: [] # add images column as array
  	add_column	:users, :images, :text, array: true, default: [] # add images column as array
  	add_column	:forum_posts, :images, :text, array: true, default: [] # add images column as array
  end
end
