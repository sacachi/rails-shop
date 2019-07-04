class CartsController < ApplicationController
  def create
    session['cart'] ||= []
    product_cart = Product.find_by(id: params[:product_id])
    return if product_cart.blank?

    productadd = build_product_add(product_cart)
    index = index_product(productadd['product_id'])
    if index.blank?
      add_product_to_cart(productadd)
    else
      index_cart_number(index, productadd['number'], true)
      update_total_price(index)
    end
    flash[:success] = 'Successful added your products to cart'
    redirect_to carts_path
  end

  def destroy
    session['cart'].delete_if { |key| key['product_id'] == params['id'].to_i }
    flash[:success] = 'Successful deleted your products'
    redirect_to carts_path
  end

  def update
    index = index_product(params[:id])
    index_cart_number(index, params['number'], false)
    update_total_price(index)
    flash[:success] = 'Successful updated your products'
    redirect_to carts_path
  end

  def index
    @carts ||= session['cart']
    @categories = Category.all
  end

  def add_product_to_cart(productadd)
    session['cart'] << productadd
  end

  def index_cart_number(index, value, boolen)
    session['cart'][index]['number'] =
      if boolen
        session['cart'][index]['number'].to_i + value.to_i
      else
        value.to_i
       end
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
