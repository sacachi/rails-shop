class ShopAccount
  class ShopOrdersController < ::ApplicationController
    layout 'admin'

    def index
      @orders = Order.left_joins(:order_products).where('order_products.product_id IN (?)',
                                                        ShopAccount.find(current_shop_account.id).product_ids)
                     .group(:id)
    end

    def show
      @order = Order.find(params[:id])
      return if @orders.blank?
    end
  end
end
