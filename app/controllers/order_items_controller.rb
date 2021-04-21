class OrderItemsController < ApplicationController
    def index
        @order_id = params[:order_id]
        order=Order.find(@order_id)
        if current_user.id == order.user_id
            render "index"
        else
            redirect_to "/"
        end        
    end
end 