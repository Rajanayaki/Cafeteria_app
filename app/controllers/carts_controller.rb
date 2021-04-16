class CartsController < ApplicationController

    def index
        render "index"
    end

    def create
        quantity=params[:menu_item_quantity]
        item_id=params[:menu_item_id] 
        item=MenuItem.find(item_id)
        if Cart.exists?(user_id: current_user.id)
            cart=Cart.find_by(user_id: current_user.id)
        else
            cart=Cart.new(user_id:current_user.id)
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

    def update
        id=params[:menu_item_id]
        quantity=params[:menu_item_quantity]
        cart_item=CartItem.find(id)
        cart_item.item_quantity = quantity
        if cart_item.save
            flash[:notice]= "Update success"
        else
            flash[:error]=cart_item.errors.full_messages.join(", ")
        end
        redirect_back(fallback_location: root_path)
    end

    def destroy
        id=params[:id]
        cart_item=CartItem.find(id)
        cart_item.destroy
        redirect_back(fallback_location: root_path)
    end
end