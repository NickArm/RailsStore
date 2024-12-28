module Admin
    class ProductCategoriesController < Admin::ApplicationController
      # List all product categories
      def index
        @categories = ProductCategory.all
      end

      # Render new category form
      def new
        @category = ProductCategory.new
      end

      # Create a new product category
      def create
        @category = ProductCategory.new(category_params)
        if @category.save
          redirect_to admin_product_categories_path, notice: "Category was successfully created."
        else
          render :new, status: :unprocessable_entity
        end
      end

      # Render edit category form
      def edit
        @category = ProductCategory.find(params[:id])
      end

      # Update an existing category
      def update
        @category = ProductCategory.find(params[:id])
        if @category.update(category_params)
          redirect_to admin_product_categories_path, notice: "Category was successfully updated."
        else
          render :edit, status: :unprocessable_entity
        end
      end

      # Delete a category only if it is not associated with any products
      def destroy
        @category = ProductCategory.find(params[:id])
        if @category.products.exists?
          redirect_to admin_product_categories_path, alert: "Cannot delete a category that is associated with products."
        else
          @category.destroy
          redirect_to admin_product_categories_path, notice: "Category was successfully deleted."
        end
      end

      private

      # Strong parameters for product categories
      def category_params
        params.require(:product_category).permit(:name)
      end
    end
end
