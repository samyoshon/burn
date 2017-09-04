class CreateMarkets < ActiveRecord::Migration
  def change
    create_table :markets do |t|
      t.integer :user_id
      t.integer :store_id
      t.string :title
      t.text :description

      t.timestamps null: false
    end
  end
end