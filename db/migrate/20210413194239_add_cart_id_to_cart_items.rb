class AddCartIdToCartItems < ActiveRecord::Migration[6.1]
  def change
    add_column :cart_items, :card_id, :bigint
  end
end
