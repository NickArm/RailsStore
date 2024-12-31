module Admin
  class ApplicationController < ::ApplicationController
    layout "admin"
    before_action :authenticate_admin

    private

    def authenticate_admin
      return if request.path == new_admin_session_path

      unless current_user&.admin?
        redirect_to new_admin_session_path, alert: "You are not authorized to access this page."
      end
    end
  end
end
