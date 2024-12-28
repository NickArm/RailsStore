class ApplicationController < ActionController::Base
  helper_method :current_user
  before_action :load_categories_and_tags

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def authenticated?
    !!current_user
  end

  private
  
  def load_categories_and_tags
    @categories = ProductCategory.all
    @tags = Tag.all
  end

end
