module Admin
    class SessionsController < ApplicationController
      def new
        # Render the login form
      end
  
      def create
        Rails.logger.debug "Params: #{params.inspect}"
      
        user = User.find_by(email_address: params[:email_address])
      
        if user&.authenticate(params[:password]) && user.admin?
          session[:user_id] = user.id
          redirect_to admin_products_path, notice: "Welcome to the admin panel!"
        else
          flash.now[:alert] = "Invalid credentials or not an admin."
          render :new, status: :unprocessable_entity
        end
      end
  
      def destroy
        session[:user_id] = nil
        redirect_to root_path, notice: "Logged out successfully."
      end
    end
  end
  