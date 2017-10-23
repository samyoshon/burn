class AddSocialToUsers < ActiveRecord::Migration[5.1]
  def change
  	add_column :users, :facebook, :string
  	add_column :users, :instagram, :string
  	add_column :users, :snapchat, :string
  	add_column :users, :twitter, :string
  end
end
