class CustomersController < ApplicationController
  before_action :authenticate_customer

  def show
    @customer = current_customer
  end

  def edit
    @customer = current_customer
  end

  def update
    @customer = current_customer

    if customer_params[:password].blank?
      params_to_update = customer_params.except(:password, :password_confirmation)
    else
      params_to_update = customer_params
    end

    if @customer.update(params_to_update)
      redirect_to customer_path, notice: "Your information has been updated successfully."
    else
      render :edit, status: :unprocessable_entity
    end
  end



  private

  def authenticate_customer
    redirect_to new_customer_session_path, alert: "You must log in first." unless current_customer
  end

  def current_customer
    @current_customer ||= Customer.find(session[:customer_id]) if session[:customer_id]
  end

  def customer_params
    params.require(:customer).permit(
    :name, :email, :phone, :gender, :birthday,
    :address, :postcode, :city, :country,
    :password, :password_confirmation
  )
  end
end
