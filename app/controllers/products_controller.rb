class ProductsController < ApplicationController

  def index
    @products = Product.all
  end

  def show
    @product = Product.find(params[:id])
    @similar_products = Product.where(product_category: @product.product_category).where.not(id: @product.id).order("RANDOM()").limit(3)
  end
  

    def product_params
      params.require(:product).permit(:name, :product_category_id, :sku, :description, :price, :main_photo, :quantity, tag_ids: [])
    end
end
