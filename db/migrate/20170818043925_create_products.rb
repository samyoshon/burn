class CreateProducts < ActiveRecord::Migration[4.2]
  def change
    create_table :products do |t|
      t.integer :user_id
      t.string :title
      t.text :description
      t.decimal :price

      t.timestamps null: false
    end
  end
end
