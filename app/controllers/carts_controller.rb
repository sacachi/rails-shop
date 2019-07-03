class CartsController < ApplicationController
  def create
    session['cart'] ||= []
    product_cart = Product.find_by(id: params[:product_id])
    return if product_cart.blank?
    productadd = build_product_add(product_cart)
    index = session['cart'].find_index { |cart| cart['product_id'] == productadd['product_id']}
    if index.blank?
      session['cart'] << productadd
    else
      session['cart'][index]['number'] = session['cart'][index]['number'].to_i + productadd['number'].to_i
      session['cart'][index]['total'] = session['cart'][index]['total'].to_i + productadd['total'].to_i
    end
  end

  def destroy
    session['cart'].delete_if { |key| key['product_id'] == params['id'].to_i }
    redirect_to '/cart'
  end

  def save; end

  def index
    @carts ||= session['cart']
    @categories = Category.all
  end

  private

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
