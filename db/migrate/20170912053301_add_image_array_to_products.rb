class AddImageArrayToProducts < ActiveRecord::Migration[4.2]
  def change
  	add_column :products, :images, :string, array: true, default: [] # add images column as array
  end
end
