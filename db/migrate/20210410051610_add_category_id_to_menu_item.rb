class AddCategoryIdToMenuItem < ActiveRecord::Migration[6.1]
  def change
    add_column :menu_items, :category_id, :bigint
  end
end
