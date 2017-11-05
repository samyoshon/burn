class AddExpirationToProducts < ActiveRecord::Migration[4.2]
  def change
    add_column :products, :expire_date, :datetime
    add_column :products, :view_count, :integer
    add_column :products, :contact_count, :integer
    add_column :forum_threads, :view_count, :integer
    add_column :forum_threads, :post_count, :integer
    add_column :categories, :market_id, :integer
  end
end
