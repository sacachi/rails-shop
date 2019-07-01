class ProductsController < ApplicationController
  def index
  end

  def show
    @product = Product.find_by(id: params[:id])
    @categories = Category.all
  end
end
