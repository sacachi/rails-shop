class ShopAccount
  class ShopOrdersController < ::ApplicationController
    layout 'admin'
    def index
      @orders = Order.all
    end

    def show
      @order = Order.find_by(id: params[:id])
      @customer = @order.user
    end
  end
end
