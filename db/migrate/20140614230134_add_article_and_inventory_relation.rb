class AddArticleAndInventoryRelation < ActiveRecord::Migration
  def change
    add_reference :inventories, :article, index: true
  end
end
