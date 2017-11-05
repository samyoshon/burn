class CreateBanners < ActiveRecord::Migration[4.2]
  def change
    create_table :banners do |t|
      t.references :user, index: true, foreign_key: true
      t.references :market, index: true, foreign_key: true
      t.text :product_index
      t.text :product_show
      t.text :forum_index
      t.text :forum_show
      t.text :account_profile

      t.timestamps null: false
    end
  end
end
