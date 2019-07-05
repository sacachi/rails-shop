module OrdersHelper
  def total_at_product(order_product)
    order_product.number.to_i * order_product.product.price.to_i
  end

  def total(order)
    total = 0
    order.order_products.each do |order_product|
      total += total_at_product(order_product)
    end
    total
  end
end
