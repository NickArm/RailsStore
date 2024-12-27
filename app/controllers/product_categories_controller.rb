class ProductCategoriesController < ApplicationController
    def index
      @categories = ProductCategory.all
    end
  
    def new
      @category = ProductCategory.new
    end
  
    def create
      @category = ProductCategory.new(category_params)
      if @category.save
        redirect_to product_categories_path, notice: 'Category created successfully.'
      else
        render :new, status: :unprocessable_entity
      end
    end
  
    private
  
    def category_params
      params.require(:product_category).permit(:name)
    end
  end
  