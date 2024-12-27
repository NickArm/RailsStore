class ProductsController < ApplicationController
  before_action :set_product, only: %i[ show edit update destroy ]

  def index
    @products = Product.all
  end

  def show
    @product = Product.find(params[:id])
  end

  def new
    @product = Product.new
    @categories = ProductCategory.all
  end

  def create
    @product = Product.new(product_params)
    @categories = ProductCategory.all
  
    if @product.save
      redirect_to @product, notice: 'Product was successfully created.'
    else
      # Debugging output for validation errors
      puts @product.errors.full_messages
      render :new, status: :unprocessable_entity
    end
  end
  

  def edit
    @product = Product.find(params[:id])
    @categories = ProductCategory.all
  end

  def update
    if @product.update(product_params)
      redirect_to @product
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @product.destroy
    redirect_to products_path
  end

  private
    def set_product
      @product = Product.find(params[:id])
    end

    def product_params
      params.require(:product).permit(:name, :product_category_id)
    end
end
