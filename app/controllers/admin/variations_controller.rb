class Admin::VariationsController < Admin::ApplicationController
    before_action :set_variation, only: %i[edit update destroy]

    def index
      @variations = Variation.includes(:variation_values).all
    end

    def new
      @variation = Variation.new
      @variation.variation_values.build
    end


    def create
      @variation = Variation.new(variation_params)
      Rails.logger.debug("Variation params: #{variation_params.inspect}")

      if @variation.save
        redirect_to admin_variations_path, notice: "Variation created successfully."
      else
        Rails.logger.debug("Errors: #{@variation.errors.full_messages}")
        render :new
      end
    end




    def edit
      @variation.variation_values_input = @variation.variation_values.pluck(:name).join("; ")
    end



    def update
      @variation = Variation.find(params[:id])

      if @variation.update(variation_params)
        redirect_to admin_variations_path, notice: "Variation updated successfully."
      else
        render :edit
      end
    end

    def destroy
      if @variation.product_variations.exists?
        redirect_to admin_variations_path, alert: "Cannot delete a variation that is used by products."
      else
        @variation.destroy
        redirect_to admin_variations_path, notice: "Variation and its values were successfully deleted."
      end
    end

    private

    def set_variation
      @variation = Variation.find(params[:id])
    end

    def product_params
      params.require(:product).permit(
        :name, :price, :sku, :product_category_id, :quantity, :description, :main_photo, tag_ids: [],
        product_variations_attributes: [ :id, :variation_id, :price, :quantity, :_destroy,
          product_variation_values_attributes: [ :id, :variation_value_id, :_destroy ] ]
      )
    end

    def values
      variation = Variation.find(params[:id])
      render json: variation.variation_values.select(:id, :name)
    end
end
