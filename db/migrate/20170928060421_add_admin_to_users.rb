class AddAdminToUsers < ActiveRecord::Migration
  def change
  	add_column :users, :admin, :boolean, default: false
  	remove_column :users, :is_admin
  end
end
