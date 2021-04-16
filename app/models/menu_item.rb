class MenuItem < ApplicationRecord
    belongs_to :menu_category, optional: true
    validates :item_name , presence:true 
    validates :item_price , presence:true 
end
