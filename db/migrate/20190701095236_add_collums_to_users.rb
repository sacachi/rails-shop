class AddCollumsToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :user_name, :string
    add_column :users, :phone, :string
    add_column :users, :address, :string

    add_index :users, :user_name, unique: true
  end
end
