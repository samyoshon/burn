class CreateForumThreads < ActiveRecord::Migration[4.2]
  def change
    create_table :forum_threads do |t|
      t.integer :user_id
      t.string :subject

      t.timestamps null: false
    end
  end
end
