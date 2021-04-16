class OrderItem < ActiveRecord::Base
    belongs_to :order , optional: true
    belongs_to :menu_item , optional: true
    validates :item_name , presence:true 
    validates :item_price , presence:true 
    validates :total_price, presence:true
    validates :quantity, presence:true 
    validates :item_id, presence:true
end