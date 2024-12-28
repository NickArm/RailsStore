class TagsController < ApplicationController
    before_action :set_tag, only: %i[show edit update destroy]
  
    def index
      @tags = Tag.all
    end
  
    def show
      
    end
  
    private
  
    def set_tag
      @tag = Tag.find(params[:id])
    end
  
    def tag_params
      params.require(:tag).permit(:name)
    end
  end
  