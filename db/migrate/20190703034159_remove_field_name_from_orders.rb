class RemoveFieldNameFromOrders < ActiveRecord::Migration[5.2]
  def change
    remove_column :orders, :order_product_id, :integer
  end
end
