module Admin
  class ProductsController < Admin::ApplicationController
    before_action :set_product, only: %i[edit update destroy]
    before_action :load_variations_and_categories, only: %i[new create edit update]

    def index
      @products = Product.all
    end

    def new
      @product = Product.new
      @product.product_variations.build.product_variation_values.build
    end

    def create
      @product = Product.new(product_params)

      if @product.save
        redirect_to admin_products_path, notice: "Product was successfully created."
      else
        render :new, status: :unprocessable_entity
      end
    end

    def edit
      @product.product_variations.each do |variation|
        variation.product_variation_values.build if variation.product_variation_values.blank?
      end
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

    def load_variations_and_categories
      @categories = ProductCategory.all
      @variations = Variation.all
      @variation_values = VariationValue.all
    end

    def product_params
      params.require(:product).permit(
        :name, :sku, :description, :price, :quantity, :main_photo, :product_category_id, tag_ids: [],
        product_variations_attributes: [
          :id, :price, :quantity, :variation_id, :_destroy,
          product_variation_values_attributes: [ :id, :variation_value_id, :_destroy ]
        ]
      )
    end
  end
end
