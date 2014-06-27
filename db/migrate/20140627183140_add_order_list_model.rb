class AddOrderListModel < ActiveRecord::Migration
  def change
    create_table :order_lists do |t|
      t.belongs_to :order
      t.belongs_to :article
      t.integer :quantity
      t.integer :unit_price
      t.integer :price

      t.timestamps
    end
  end
end
