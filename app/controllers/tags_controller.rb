class TagsController < ApplicationController
    before_action :set_tag, only: %i[show edit update destroy]
  
    def index
      @tags = Tag.all
    end
  
    def show
      # Optional: Display products associated with the tag
    end
  
    def new
      @tag = Tag.new
    end
  
    def create
      @tag = Tag.new(tag_params)
      if @tag.save
        redirect_to tags_path, notice: 'Tag was successfully created.'
      else
        render :new, status: :unprocessable_entity
      end
    end
  
    def edit
    end
  
    def update
      if @tag.update(tag_params)
        redirect_to tags_path, notice: 'Tag was successfully updated.'
      else
        render :edit, status: :unprocessable_entity
      end
    end
  
    def destroy
        #not destroy if tag belongs to a product
      if @tag.products.any?
        redirect_to tags_path, alert: 'Cannot delete a tag that is associated with products.'
      else
        @tag.destroy
        redirect_to tags_path, notice: 'Tag was successfully deleted.'
      end
    end
  
    private
  
    def set_tag
      @tag = Tag.find(params[:id])
    end
  
    def tag_params
      params.require(:tag).permit(:name)
    end
  end
  