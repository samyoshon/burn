class CreateCategories < ActiveRecord::Migration[4.2]
  def change
    create_table :categories do |t|
      t.string :category_name

      t.timestamps null: false
    end

    add_column :products, :category_id, :integer
  end
end
