class RemoveTotalFromOrder < ActiveRecord::Migration
  def up
    remove_column :orders, :total
  end

  def down
    add_column :orders, :total, :integer, default: 0
  end
end
