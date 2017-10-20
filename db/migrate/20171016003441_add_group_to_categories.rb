class AddGroupToCategories < ActiveRecord::Migration[5.1]
  def change
  	add_reference :categories, :group, index: true, foreign_key: true
  	add_reference :forum_categories, :group, index: true, foreign_key: true
  	add_column :groups, :name, :string
  end
end
