class AddForumCategoryIdToForumThreads < ActiveRecord::Migration
  def change
  	add_reference :forum_threads, :forum_category, index: true, foreign_key: true
  	add_column :users, :is_flagged, :integer
  	add_column :users, :phone_number, :integer
  end
end
