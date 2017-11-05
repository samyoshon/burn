class AddMarketIdToProducts < ActiveRecord::Migration[4.2]
  def change
    add_column :products, :market_id, :integer
  end
end
