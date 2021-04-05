class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|
      t.bigint :quantity
      t.decimal :total
      t.string :status

      t.timestamps
    end
  end
end
