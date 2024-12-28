module Admin
    class ApplicationController < ::ApplicationController
      layout "admin" 
      before_action :authenticate_admin
  
      private
  
      def authenticate_admin
        # Add your admin authentication logic here
      end
    end
  end
  