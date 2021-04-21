class Cart < ActiveRecord::Base
    has_many :cart_items
    belongs_to :user 
    validates :user_id , presence:true  
    def self.of_user(user)
        all.find_by(user_id: user.id)
    end
end