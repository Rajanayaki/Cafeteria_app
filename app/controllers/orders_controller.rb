class OrdersController < ApplicationController
    before_action :check_as_admin , only: [:pending_orders,:delivered_orders,:update]
    before_action :check_as_clerk , only: [:pending_orders,:delivered_orders,:update]


    def index
        render "index"
    end

    def create
        cart=Cart.find_by("user_id=?", current_user.id) 
        order=Order.new("user_id=?", current_user.id,"status=?", "False")
        order.save 
        netpay= 0   
        while CartItem.find_by("card_id= ?",cart.id)
            cart_item=CartItem.find_by("card_id= ?", cart.id) 
            order_items= OrderItem.new(
                    item_id:cart_item[:item_id],
                    quantity:cart_item[:item_quantity],
                    total_price:cart_item[:item_price] * cart_item[:item_quantity],
                    item_name:cart_item[:item_name],
                    order_id:order.id,
                    item_price: cart_item[:item_price]
                    )
            netpay+= cart_item[:item_price] * cart_item[:item_quantity]
            order_status= order_items.save 
            if order_status

            else
                flash[:error]=order_items.errors.full_messages.join(", ")
                redirect_to "/"
            end
            CartItem.destroy(cart_item[:id])
        end
        order.netpay=netpay
        order_db=order.save
        if order_db
            redirect_to orders_path
        else
            flash[:error]=order_db.errors.full_messages.join(", ")
            redirect_to "/"
        end
    end  
    def show 
        @order = Order.find(params[:order_id])
        respond_to do |format|
            format.html
            format.pdf do
              pdf = OrderPdf.new(@order, view_context)
              send_data pdf.render, filename: "order_#{@order.id}.pdf",
                                    type: "application/pdf",
                                    disposition: "inline" 
            end
        end
    end

    def pending
        @not_delivered = Order.pending_orders
        render "pending" , locals: { pending_orders_id: @not_delivered }
    end
    
<<<<<<< HEAD
    def delivered
        @delivered_orders = Order.delivered_orders
=======
    def delivered_orders
        @delivered_orders = Order.where("status=?","Delivered").pluck(:id)
>>>>>>> parent of 3189b97... Fixed bug in orderitems display
        render  "delivered" , locals: {delivered_orders_id: @delivered_orders}
    end 

    def update
        id=params[:order_id]
        order = Order.find(id)
        order.status= order.status== "False" ? "Delivered" : "False"
        if order.save
            redirect_back(fallback_location: root_path)
        else
            flash[:error]=order.errors.full_messages.join(", ")
            redirect_to "/"
        end
    end

    def destroy
        id=params[:id]
        order_item=OrderItem.find(id)
        order_item.destroy
        redirect_back(fallback_location: root_path)
    end

end