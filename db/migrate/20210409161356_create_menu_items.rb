class CreateMenuItems < ActiveRecord::Migration[6.1]
  def change
    create_table :menu_items do |t|
      t.string :item_name
      t.bigint :item_price

      t.timestamps
    end
  end
end
