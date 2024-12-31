module Admin
    class CustomersController < Admin::ApplicationController
      def index
        @customers = Customer.all.order(created_at: :desc)
      end

      def show
        @customer = Customer.find(params[:id])
      end
    end
end
