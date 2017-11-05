class AddMarketToForumThreads < ActiveRecord::Migration[4.2]
  def change
  	add_reference :forum_threads, :market, index: true, foreign_key: true
  	remove_column :forum_categories, :category_id
  	remove_column :forum_threads, :image_data
  	remove_column :forum_threads, :view_count
  	add_column :forum_categories, :category_name, :string
  end
end
