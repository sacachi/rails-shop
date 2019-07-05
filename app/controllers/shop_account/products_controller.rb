class ShopAccount
  class ProductsController < ::ApplicationController
    before_action :authenticate_shop_account!
    before_action :set_product, only: %i[show edit update destroy]
    layout 'admin'

    # GET /products
    # GET /products.json
    def index
      @products = Product.all
      @categories = Category.all
    end

    # GET /products/1
    # GET /products/1.json
    def show
      @categories = Category.all
    end

    # GET /products/new
    def new
      @product = Product.new
      @categories = Category.all
    end

    # GET /products/1/edit
    def edit
      @categories = Category.all
    end

    # POST /products
    # POST /products.json
    def create
      @categories = Category.all
      @product = Product.new(product_params)
      @product.shop_account = current_shop_account
      respond_to do |format|
        if @product.save
          params['product']['category_products'].reject!(&:blank?).each do |category|
            @product.category_products.create!(category_id: category)
          end
          format.html { redirect_to shop_account_products_path, notice: 'Product was successfully created.' }
          format.json { render :show, status: :created, location: @product }
        else
          format.html { render :new }
          format.json { render json: @product.errors, status: :unprocessable_entity }
        end
      end
    end

    # PATCH/PUT /products/1
    # PATCH/PUT /products/1.json
    def update
      respond_to do |format|
        if @product.update(product_params)
          @product.category_products.each(&:destroy)
          params['product']['category_products'].reject!(&:blank?).each do |category|
            @product.category_products.create!(category_id: category)
          end
          format.html { redirect_to shop_account_product_path(@product),notice: 'Product was successfully updated.' }
          format.json { render :show, status: :ok, location: @product }
        else
          format.html { render :edit }
          format.json { render json: @product.errors, status: :unprocessable_entity }
        end
      end
    end

    # DELETE /products/1
    # DELETE /products/1.json
    def destroy
      @product.destroy
      respond_to do |format|
        format.html { redirect_to shop_account_products_url, notice: 'Product was successfully destroyed.' }
        format.json { head :no_content }
      end
    end

    private

    # Use callbacks to share common setup or constraints between actions.
    def set_product
      @product = Product.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def product_params
      params
        .require(:product)
        .permit(
          :name, :desc, :images, :price, :shop_account_id,
          category_products_attributes: %i[id product category]
        )
    end
  end
end
