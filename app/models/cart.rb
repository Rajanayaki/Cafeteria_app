class Cart < ActiveRecord::Base
    has_many :cart_items
    belongs_to :user 
    validates :user_id , presence:true
end