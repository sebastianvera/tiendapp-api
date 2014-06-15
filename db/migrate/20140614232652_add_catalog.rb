class AddCatalog < ActiveRecord::Migration
  def change
    create_table :catalogs do |t|
      t.belongs_to :article
      t.belongs_to :provider
      t.float :price
      t.integer :stock
      t.integer :min_quantity

      t.timestamps
    end
  end
end
