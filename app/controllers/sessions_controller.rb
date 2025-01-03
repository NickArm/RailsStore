class SessionsController < ApplicationController
    def new
      # Renders the login form
    end

    def create
      admin = User.find_by(email_address: params[:email_address])

      if admin&.authenticate(params[:password]) && admin.admin?
        session[:user_id] = admin.id
        redirect_to admin_root_path, notice: "Logged in successfully."
      else
        flash.now[:alert] = "Invalid email or password."
        render :new
      end
    end

    def destroy
      session[:user_id] = nil
      redirect_to admin_session_path, notice: "Logged out successfully."
    end
end
