class OrderItemsController < ApplicationController
    def index
        @order_id = params[:order_id]
        render "index" , locals: { order_id: @order_id }
    end
end 