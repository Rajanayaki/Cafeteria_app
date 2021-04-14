class CartItem < ActiveRecord::Base
    belongs_to :cart, optional: true
    belongs_to :menu_item , optional: true

end