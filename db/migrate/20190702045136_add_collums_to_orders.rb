class AddCollumsToOrders < ActiveRecord::Migration[5.2]
  def change
    add_column  :orders, :total_price, :integer
    add_column  :order_products, :price, :integer
    add_column  :order_products, :number, :integer
  end
end
