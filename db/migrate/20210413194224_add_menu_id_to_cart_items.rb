class AddMenuIdToCartItems < ActiveRecord::Migration[6.1]
  def change
    add_column :cart_items, :item_id, :bigint
    add_column :cart_items, :item_name, :string
    add_column :cart_items, :item_price, :bigint
  end
end
