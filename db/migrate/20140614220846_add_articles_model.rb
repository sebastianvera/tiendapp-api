class AddArticlesModel < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.string :name
      t.string :description
      t.string :unit

      t.timestamps
    end
  end
end
