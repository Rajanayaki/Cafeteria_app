class Order < ActiveRecord::Base
    has_many :order_items
    belongs_to :user
    validates :user_id , presence:true 
    validates :netpay , presence:true
    validates :status , presence:true

    def self.pending_orders 
        @not_delivered= Order.all.where("status=?","False").pluck(:id)
    end

    def self.delivered_orders
        @delivered_orders = Order.where("status=?", "Delivered").pluck(:id)
    end
end