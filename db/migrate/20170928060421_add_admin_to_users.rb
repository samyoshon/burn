class AddAdminToUsers < ActiveRecord::Migration[4.2]
  def change
  	add_column :users, :admin, :boolean, default: false
  	remove_column :users, :is_admin
  end
end
