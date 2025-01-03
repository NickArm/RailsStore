class ProductsController < ApplicationController
  def index
    @products = Product.all
  end

  def show
    @product = Product.find(params[:id])
    @variations = @product.product_variations.includes(:variation, :product_variation_values)
    @similar_products = Product.where(product_category: @product.product_category).where.not(id: @product.id).order("RANDOM()").limit(3)

    # Calculate price range for variations
    if @variations.any?
      prices = @variations.map(&:price).compact
      @min_price = prices.min
      @max_price = prices.max
    else
      @min_price = @max_price = @product.price
    end
  end



    def product_params
      params.require(:product).permit(:name, :product_category_id, :sku, :description, :price, :main_photo, :quantity, tag_ids: [])
    end
end
