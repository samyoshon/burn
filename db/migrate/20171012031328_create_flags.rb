class CreateFlags < ActiveRecord::Migration[5.1]
  def change
    create_table :flags do |t|
      t.references :user, foreign_key: true
      t.references :product, foreign_key: true
      t.timestamps
    end

    create_table :groups do |t|
      t.references :market, foreign_key: true
    end

    add_column :products, :contact_pref, :integer
    add_column :markets, :first_color, :string
    add_column :markets, :second_color, :string
    add_column :markets, :email_address_type, :string
    add_reference :markets, :group, index: true, foreign_key: true    
  end


end
