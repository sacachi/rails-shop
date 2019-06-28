class PagesController < ApplicationController
  def home
    @categories = Category.all
    @products = Product.all
  end
end
