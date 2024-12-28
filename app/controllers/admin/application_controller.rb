module Admin
    class ApplicationController < ::ApplicationController
      layout "admin"
      before_action :authenticate_admin

      def authenticate_admin
        unless current_user&.admin?
          redirect_to root_path, alert: "You are not authorized to access this page."
        end
      end
    end
end
