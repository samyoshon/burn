class CreateForumCategories < ActiveRecord::Migration[4.2]
  def change
    create_table :forum_categories do |t|
      t.references :user, index: true, foreign_key: true
      t.references :category, index: true, foreign_key: true
      t.references :market, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
