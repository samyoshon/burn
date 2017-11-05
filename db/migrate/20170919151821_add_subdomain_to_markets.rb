class AddSubdomainToMarkets < ActiveRecord::Migration[4.2]
  def change
  	remove_column :products, :category_id
  	remove_column :products, :market_id
  	remove_column :products, :user_id
  	add_column :markets, :subdomain, :text
  	add_column :users, :is_admin, :boolean, default: false
  	add_column :users, :is_advertiser, :boolean, default: false
  	add_column :users, :is_mod, :boolean, default: false
  	add_reference :users, :market, index: true, foreign_key: true
  	add_reference :products, :category, index: true, foreign_key: true
    add_reference :products, :market, index: true, foreign_key: true
    add_reference :products, :user, index: true, foreign_key: true
  end
end
