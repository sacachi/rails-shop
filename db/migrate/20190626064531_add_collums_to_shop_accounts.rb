class AddCollumsToShopAccounts < ActiveRecord::Migration[5.2]
  def change
    add_column :shop_accounts, :shop_name, :string
    add_column :shop_accounts, :phone, :string
    add_column :shop_accounts, :address, :string
    add_column :shop_accounts, :desc, :string
    add_column :shop_accounts, :tax_code, :string

    add_index :shop_accounts, :shop_name, unique: true

  end
end
