class OrderItemsController < ApplicationController
    def index
        @order_id = params[:order_id]
        render "index"
    end

end