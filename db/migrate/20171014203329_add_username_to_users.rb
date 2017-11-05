class AddUsernameToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :username, :string, unique: true
    add_column :products, :contact_by_email, :boolean, default: true
    add_column :products, :contact_by_phone, :boolean, default: false
  	remove_column :users, :phone_number
    add_column :users, :phone_number, :string
  end
end
