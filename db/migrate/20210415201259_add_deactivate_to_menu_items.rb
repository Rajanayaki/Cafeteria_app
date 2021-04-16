class AddDeactivateToMenuItems < ActiveRecord::Migration[6.1]
  def change
    add_column :menu_items, :deactivate, :boolean, default: false
  end
end
