class AddImageArrayToProducts < ActiveRecord::Migration
  def change
  	add_column :products, :images, :string, array: true, default: [] # add images column as array
  end
end
