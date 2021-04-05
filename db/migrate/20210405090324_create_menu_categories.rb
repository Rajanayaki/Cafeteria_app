class CreateMenuCategories < ActiveRecord::Migration[6.1]
  def change
    create_table :menu_categories do |t|
      t.string :category_name
      t.bigint :stock

      t.timestamps
    end
  end
end
