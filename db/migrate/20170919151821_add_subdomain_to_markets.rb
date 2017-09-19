class AddSubdomainToMarkets < ActiveRecord::Migration
  def change
  	add_column :markets, :subdomain, :text
  	add_column :users, :is_admin, :boolean, default: false
  	add_column :users, :is_advertiser, :boolean, default: false
  	add_column :users, :is_mod, :boolean, default: false
  end
end
