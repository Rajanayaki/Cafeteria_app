class MenuCategoriesController < ApplicationController
    def index
        render "index"
    end

    def create
        menu_category_name = params[:menu_category_name]
        new_menu_category= MenuCategory.new(
            category_name: menu_category_name
        )
        if new_menu_category.save
            redirect_to menu_categories_path
        else
            redirect_to "/"
        end
    end

    def show()
        @category_id = (params[:id]).to_i
        @category_object = MenuCategory.find(@category_id)
        @category_name = @category_object.category_name
        render "menu_items/index"
    end
end