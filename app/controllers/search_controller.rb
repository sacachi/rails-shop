class SearchController < ApplicationController
  def search
    @categories = Category.all
    @products = Product.where('lower(name) LIKE ? ', "%#{params[:product_name].downcase}%")
    render :index
  end

  def index; end
end
