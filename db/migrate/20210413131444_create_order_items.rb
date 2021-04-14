class CreateOrderItems < ActiveRecord::Migration[6.1]
  def change
    create_table :order_items do |t|
      t.bigint :quantity
      t.bigint :total_price

      t.timestamps
    end
  end
end
