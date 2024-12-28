module Admin
    class TagsController < Admin::ApplicationController
      # List all tags
      def index
        @tags = Tag.all
      end

      # Render new tag form
      def new
        @tag = Tag.new
      end

      # Create a new tag
      def create
        @tag = Tag.new(tag_params)
        if @tag.save
          redirect_to admin_tags_path, notice: "Tag was successfully created."
        else
          render :new, status: :unprocessable_entity
        end
      end

      # Render edit tag form
      def edit
        @tag = Tag.find(params[:id])
      end

      # Update an existing tag
      def update
        @tag = Tag.find(params[:id])
        if @tag.update(tag_params)
          redirect_to admin_tags_path, notice: "Tag was successfully updated."
        else
          render :edit, status: :unprocessable_entity
        end
      end

      # Delete a tag only if it is not associated with products
      def destroy
        @tag = Tag.find(params[:id])
        if @tag.products.exists?
          redirect_to admin_tags_path, alert: "Cannot delete a tag that is associated with products."
        else
          @tag.destroy
          redirect_to admin_tags_path, notice: "Tag was successfully deleted."
        end
      end

      private

      # Strong parameters for tags
      def tag_params
        params.require(:tag).permit(:name)
      end
    end
end
