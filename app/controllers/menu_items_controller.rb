class MenuItemsController < ApplicationController
    def index
        render "index"
    end

    def create
        menu_item_name = params[:menu_item_name]
        menu_item_price = params[:menu_item_price]
        category_id=params[:category_id]
        new_menu_item= MenuItem.new(
            item_name: menu_item_name ,
            item_price: menu_item_price,
            category_id: category_id
        )
        if new_menu_item.save
            redirect_back(fallback_location: root_path)
        else
            flash[:error]=new_menu_item.errors.full_messages.join(", ")

            redirect_to "/"
        end
    end  

    def destroy
        id=params[:id]
        menu_item=MenuItem.find(id)
        menu_item.destroy
        redirect_back(fallback_location: root_path)
    end
end