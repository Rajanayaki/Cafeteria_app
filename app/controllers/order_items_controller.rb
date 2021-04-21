class OrderItemsController < ApplicationController
    def index
        @order_id = params[:order_id]
        order=Order.find(@order_id)
        if current_user.id == order.user_id || current_user.superadmin_role==true || current_user.clerks_role==true 
            render "index"
        else
            redirect_to "/"
        end        
    end
end 