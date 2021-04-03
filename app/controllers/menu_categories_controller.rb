class MenuCategoriesController < ApplicationController
    def index
        render plain: MenuCategory.all.to_a
    end

end