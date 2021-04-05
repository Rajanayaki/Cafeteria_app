class MenuCategoriesController < ApplicationController
    def index
        render "index"
    end

    def create
        menu_category_name = params[:menu_category_name]
        new_menu_category= MenuCategory.new(
            name: menu_category_name
        )
        if new_menu_category.save
            redirect_to menu_categories_path
        else
            redirect_to "/"
        end
    end

end