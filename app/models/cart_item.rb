class CartItem < ActiveRecord::Base
    belongs_to :cart, optional: true
    belongs_to :menu_item , optional: true
    validates :item_name , presence:true 
    validates :item_price , presence:true
    validates :item_quantity, presence:true
    validates :card_id , presence:true 
end