class OrdersController < ApplicationController
  before_action :user_logged_in?, only: %i[create show index]
  before_action :cart_empty?, only: :create
  layout 'admin', only: %i[index show]

  def create
    order = Order.new
    order.customer_id = current_user.id
    if order.save
      session['cart'].each do |cart|
        product = Product.find_by(id: cart['product_id'])

        next unless product.present?

        order_product = order.order_products.build(
          number: cart['number'],
          product_id: product.id,
          price: product.price
        )

        order_product.save
      end
    end

    session['cart'] = []
    flash[:info] = 'Your order successfully'
    redirect_to order_path(order)
    OrderMailer.user_mail(order.id).deliver_later
    OrderMailer.shop_mail(order.id).deliver_later
  end

  def index
    @categories = Category.all
    @orders = Order.where(customer_id: current_user.id)
  end

  def show
    @categories = Category.all
    @order = Order.find_by(id: params['id'])
  end

  private

  def cart_empty?
    if session['cart'].blank?
      flash[:danger] = 'You need to buy something before check out!'
      redirect_to carts_path
    end
  end

  def user_logged_in?
    redirect_to new_user_session_path, alert: 'You need login to continue' unless user_signed_in?
  end
end
