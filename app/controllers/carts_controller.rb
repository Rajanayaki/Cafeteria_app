class CartsController < ApplicationController
    def index
        render "index"
    end

    def create
        quantity=params[:menu_item_quantity]
        item_id=params[:menu_item_id] 
        item=MenuItem.find(item_id)
        if Cart.exists?(current_user.id)
            cart=Cart.find(current_user.id)
        else
            cart=Cart.new(user_id: current_user.id)
            cart.save
        end       
        cart_items= CartItem.new(item_id:item_id,item_quantity:quantity,item_price:item.item_price,item_name:item.item_name,card_id:cart.id)
        if cart_items.save 
            redirect_back(fallback_location: root_path)
        else
            flash[:error]=cart_items.errors.full_messages.join(", ")
            redirect_to "/"
        end
    end  

    def destroy
        id=params[:id]
        cart_item=CartItem.find(id)
        cart_item.destroy
        redirect_back(fallback_location: root_path)
    end
end