class ProductCategoriesController < ApplicationController
    def index
      @categories = ProductCategory.all
    end
  
    private
  
    def category_params
      params.require(:product_category).permit(:name)
    end
  end
  