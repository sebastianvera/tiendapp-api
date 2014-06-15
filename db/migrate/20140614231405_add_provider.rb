class AddProvider < ActiveRecord::Migration
  def change
    create_table :providers do |t|
      t.string :name
      t.string :address
      t.string :phone
      t.integer :frequency
      t.integer :min_order
      t.integer :count, default: 0

      t.timestamps
    end
  end
end
