class OrdersController < ApplicationController
    def index
        render "index"
    end

    def create
        cart=Cart.find_by(user_id: current_user.id) 
        order=Order.new(user_id: current_user.id,status: "False")
        order.save 
        netpay= 0   
        while CartItem.find_by(card_id: cart.id)
            cart_item=CartItem.find_by(card_id: cart.id) 
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
            redirect_back(fallback_location: root_path)
        else
            flash[:error]=order_db.errors.full_messages.join(", ")
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