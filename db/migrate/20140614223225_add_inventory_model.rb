class AddInventoryModel < ActiveRecord::Migration
  def change
    create_table :inventories do |t|
      t.integer :max_quantity
      t.integer :min_quantity
      t.integer :stock
      t.integer :daily_consume
      t.float :price

      t.timestamps
    end
  end
end
