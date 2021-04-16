class UsersController < ApplicationController
    before_action :check_as_admin
    

    def index
        render "index"
    end

    def customers
        @customers = User.where(superadmin_role: false).where(user_role: true ).pluck(:id)
        render "show_users" , locals: { role: "customers" , ids: @customers}
    end

    def clerks
        @clerks = User.where(clerks_role: true).where(superadmin_role: false).pluck(:id)
        render "show_users" , locals: { role: "clerks" , ids: @clerks}
    end

    def admins
        @admins = User.where(superadmin_role: true ).pluck(:id)
        render "show_users" , locals: { role: "admins" , ids: @admins}
    end
    def add_new_users
        email = params[:email]
        password = params[:password]
        new_user= User.new(email: email , password: password)
        if params[:role]=="clerk_role"
            new_user.clerks_role = true 
            new_user.user_role = false
        else
            new_user.superadmin_role = true
        end
        if new_user.save
            redirect_to users_path
        else
            flash[:error]=new_user.errors.full_messages.join(", ")
            redirect_back(fallback_location: root_path)
        end 

    end
end