class AddMarketIdToProducts < ActiveRecord::Migration
  def change
    add_column :products, :market_id, :integer
  end
end
