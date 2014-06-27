class AddOrderModel < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.belongs_to :provider
      t.integer :price
      t.integer :total
      t.integer :freight_charge
      t.boolean :delivered, default: false

      t.timestamps
    end
  end
end
