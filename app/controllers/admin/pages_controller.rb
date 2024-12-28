module Admin
    class PagesController < Admin::ApplicationController
      before_action :set_page, only: [ :edit, :update, :destroy ]

      def index
        @pages = Page.all
      end

      def new
        @page = Page.new
      end

      def create
        @page = Page.new(page_params)
        if @page.save
          redirect_to admin_pages_path, notice: "Page was successfully created."
        else
          render :new, status: :unprocessable_entity
        end
      end

      def edit
      end

      def update
        if @page.update(page_params)
          redirect_to admin_pages_path, notice: "Page was successfully updated."
        else
          render :edit, status: :unprocessable_entity
        end
      end

      def destroy
        @page.destroy
        redirect_to admin_pages_path, notice: "Page was successfully deleted."
      end

      private

      def set_page
        @page = Page.find(params[:id])
      end

      def page_params
        params.require(:page).permit(:title, :content)
      end
    end
end
