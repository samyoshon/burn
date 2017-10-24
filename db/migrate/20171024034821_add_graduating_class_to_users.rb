class AddGraduatingClassToUsers < ActiveRecord::Migration[5.1]
  def change
  	add_column :users, :school_class, :integer
  	add_column :users, :school_program, :string
  	remove_column :products, :price
    add_column :products, :price, :integer
  end
end
