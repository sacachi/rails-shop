class CategoriesController < ApplicationController
  def index
  end

  def show
    @category = Category.find_by(id: params[:id])
    @products = @category.products.page params[:page]
    @categories = Category.all
  end
end
