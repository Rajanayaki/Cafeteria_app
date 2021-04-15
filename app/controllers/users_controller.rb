class UsersController < ApplicationController
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

    def addusers 
        render "add_new_users"

    end
end