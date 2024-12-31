class Admin::SessionsController < Admin::ApplicationController
  skip_before_action :authenticate_admin, only: [ :new, :create ]

  def new
  end

  def create
    user = User.find_by(email_address: session_params[:email_address])
    if user&.authenticate(session_params[:password]) && user.admin?
      session[:user_id] = user.id
      redirect_to admin_root_path, notice: "Logged in successfully."
    else
      flash.now[:alert] = "Invalid email or password."
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path, notice: "Logged out successfully."
  end

  private

  def session_params
    params.permit(:email_address, :password)
  end
end
