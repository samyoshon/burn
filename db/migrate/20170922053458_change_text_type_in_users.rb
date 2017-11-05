class ChangeTextTypeInUsers < ActiveRecord::Migration[4.2]
  def up
    change_column :users, :images, :text, array: false, default: nil, using: "(array_to_string(images, ','))"
  end

  def down
    change_column :users, :images, :text, array: true, default: [], using: "(string_to_array(images, ','))"
  end
end
