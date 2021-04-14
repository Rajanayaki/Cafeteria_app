class MenuItem < ApplicationRecord
    belongs_to :menu_category, optional: true
end
