class CreateAddMarketIdToProducts < ActiveRecord::Migration
  def change
    create_table :add_market_id_to_products do |t|
      t.integer :market_id

      t.timestamps null: false
    end
  end
end
