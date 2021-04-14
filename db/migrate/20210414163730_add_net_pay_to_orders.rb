class AddNetPayToOrders < ActiveRecord::Migration[6.1]
  def change
    add_column :orders, :netpay, :bigint
  end
end
