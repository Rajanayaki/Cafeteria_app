class AddMenuItemIdToOrderItems < ActiveRecord::Migration[6.1]
  def change
    add_column :order_items, :item_id, :bigint
    add_column :order_items, :item_name, :string
    add_column :order_items, :item_price, :bigint
  end
end
