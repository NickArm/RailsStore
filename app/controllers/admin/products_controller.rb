module Admin
  class ProductsController < Admin::ApplicationController
    before_action :set_product, only: %i[edit update destroy]

    def index
      @products = Product.all
    end

    def new
      @product = Product.new
      @categories = ProductCategory.all
    end

    def create
      @product = Product.new(product_params)
      @categories = ProductCategory.all

      if @product.save
        redirect_to admin_products_path, notice: "Product was successfully created."
      else
        render :new, status: :unprocessable_entity
      end
    end

    def edit
      @categories = ProductCategory.all
    end

    def update
      if @product.update(product_params)
        redirect_to admin_products_path, notice: "Product was successfully updated."
      else
        render :edit, status: :unprocessable_entity
      end
    end

    def destroy
      @product.destroy
      redirect_to admin_products_path, notice: "Product was successfully deleted."
    end

    private

    def set_product
      @product = Product.find(params[:id])
    end

    def product_params
      params.require(:product).permit(:name, :price, :sku, :product_category_id, :quantity, :description, :main_photo, tag_ids: [])
    end
  end
end
