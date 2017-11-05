class AddProductNewToBanners < ActiveRecord::Migration[4.2]
  def change
  	add_column :banners, :product_new, :text
  	add_column :banners, :forum_new, :text
  end
end
