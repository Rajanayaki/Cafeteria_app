class ApplicationController < ActionController::Base
    before_action :authenticate_user!
    helper_method :check_as_admin , :check_as_clerk

    def check_as_clerk
        if !current_user.superadmin_role? && !current_user.clerks_role?
          flash[:notice] = "You are not Authorized to perform this action."
          redirect_to root_path
        end
      end
    
    def check_as_admin
        if !current_user.superadmin_role?
            flash[:notice] = "You are not Authorized to perform this action."
            redirect_to root_path
        end
    end
    
end
