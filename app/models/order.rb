class Order < ActiveRecord::Base
    has_many :order_items
    belongs_to :user
    validates :user_id , presence:true 
    validates :status , presence:true
    def self.of_user(user)
        all.where(user_id: user.id)
    end
    
    def self.pending_orders_list
        all.where("status=?","False")
    end

    def self.delivered_orders_list
        all.where("status=?", "Delivered")
    end
end