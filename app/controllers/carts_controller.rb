class CartsController < ApplicationController
  before_action :user_logged_in?, only: :save
  before_action :cart_empty?, only: :save

  def create
    session['cart'] ||= []
    product_cart = Product.find_by(id: params[:product_id])
    return if product_cart.blank?

    productadd = build_product_add(product_cart)
    index = index_product(productadd['product_id'])
    if index.blank?
      add_product_to_cart(productadd)
    else
      index_cart_number(index, productadd['number'])
      update_total_price(index)
    end
    flash[:success] = 'Successful added your products to cart'
    redirect_to '/cart'
  end

  def delete
    session['cart'].delete_if { |key| key['product_id'] == params['format'].to_i }
    flash[:success] = 'Successful deleted your products'
    redirect_to '/cart'
  end

  def update
    index = index_product(params[:product_id])
    index_cart_number(index, params['number'])
    update_total_price(index)
    flash[:success] = 'Successful updated your products'
    redirect_to '/cart'
  end

  def show
    @categories = Category.all
    @orders = Order.where(customer_id: current_user.id)
    render 'show'
  end

  def save
    order = Order.new
    order.customer_id = current_user.id
    if order.save
      session['cart'].each do |cart|
        product = Product.find_by(id: cart['product_id'])
        order_product = order.order_products.new
        order_product.product = product
        order_product.number = cart['number']
        order_product.price = product.price
        order_product.save
      end
    end

    session['cart'] = []
    flash[:info] = 'Your order successfully'
    redirect_to carts_show_path
  end

  def index
    @carts ||= session['cart']
    @categories = Category.all
  end

  private

  def cart_empty?
    if session['cart'].blank?
      flash[:danger] = 'You need to buy something before check out!'
      redirect_to '/cart'
    end
  end

  def user_logged_in?
    redirect_to new_user_session_path, alert: 'You need login to continue' unless user_signed_in?
  end

  private

  def add_product_to_cart(productadd)
    session['cart'] << productadd
  end

  def index_cart_number(index, value)
    session['cart'][index]['number'] = session['cart'][index]['number'].to_i + value.to_i
  end

  def update_total_price(index)
    session['cart'][index]['total'] = session['cart'][index]['number'].to_i *
                                      session['cart'][index]['price'].to_i
  end

  def index_product(id)
    session['cart'].find_index { |cart| cart['product_id'] == id.to_i }
  end

  def cart_params
    params.permit(:product_id, :number)
  end

  def build_product_add(product_cart)
    {
      'product_id' => product_cart.id,
      'number' => params[:number],
      'price' => product_cart.price,
      'name' => product_cart.name,
      'image' => product_cart.images_url,
      'total' => product_cart.price.to_i * params[:number].to_i
    }
  end
end
