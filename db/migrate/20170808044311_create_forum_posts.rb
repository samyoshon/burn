class CreateForumPosts < ActiveRecord::Migration[4.2]
  def change
    create_table :forum_posts do |t|
      t.integer :forum_thread_id
      t.integer :user_id
      t.text :body

      t.timestamps null: false
    end
  end
end
