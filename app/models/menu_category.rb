class MenuCategory < ApplicationRecord
    has_many :menu_items
    validates :category_name , presence:true 
end
