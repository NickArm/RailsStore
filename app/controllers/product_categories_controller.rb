class ProductCategoriesController < ApplicationController
    def index
      @categories = ProductCategory.all
    end



    def show
      @category = ProductCategory.find(params[:id])
      @products = @category.products
    end

    def category_params
      params.require(:product_category).permit(:name)
    end
end
