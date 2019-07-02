class CartsController < ApplicationController
  def create
    session['cart'] ||= []
    product_cart = Product.find_by(id: params[:product_id])
    productadd = {
      'product_id' => params[:product_id],
      'number' => params[:number],
      'price' => product_cart.price,
      'name' => product_cart.name,
      'image' => product_cart.images_url,
      'total' => product_cart.price.to_i * params[:number].to_i
    }

    in_array = false
    session['cart'].each do |cart|
      next unless cart['product_id'] == productadd['product_id']

      cart['number'] = cart['number'].to_i + productadd['number'].to_i
      cart['total']  = cart['total'].to_i  + productadd['total'].to_i
      in_array = true
      break
    end
    session['cart'] << productadd unless in_array
  end

  def save; end

  def index
    @carts ||= session['cart']
    @products = Product.all
    @categories = Category.all
  end

  private

  def cart_params
    params.permit(:product_id, :number)
  end
end
