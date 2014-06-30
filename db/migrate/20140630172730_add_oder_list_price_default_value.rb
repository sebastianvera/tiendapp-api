class AddOderListPriceDefaultValue < ActiveRecord::Migration
  def up
    change_column :order_lists, :price, :integer, default: 0
  end

  def down
    change_column :oder_lists, :price, :integer
  end
end
