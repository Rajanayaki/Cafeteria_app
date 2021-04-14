class OrderItem < ActiveRecord::Base
    belongs_to :order , optional: true
    belongs_to :menu_item , optional: true

end