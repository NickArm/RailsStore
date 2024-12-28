class TagsController < ApplicationController
    before_action only: %i[show edit]
  
    def index
      @tags = Tag.all
    end
  
    def set_tag
      @tag = Tag.find(params[:id])
    end

    def show
      @tag = Tag.find(params[:id])
      @products = @tag.products
    end

    def tag_params
      params.require(:tag).permit(:name)
    end
  end
  