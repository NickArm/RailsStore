module Admin
    class ApplicationController < ::ApplicationController
      layout "admin" 
      before_action :authenticate_admin
    end
end
  