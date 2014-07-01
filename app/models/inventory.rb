class Inventory < ActiveRecord::Base
  validates_presence_of :min_quantity, :max_quantity, :daily_consume, :stock
  validates_presence_of :price
  validates_numericality_of :daily_consume, :price, :stock, greater_than: 0

  belongs_to :article

  def as_json(options = {})
    h = super(options)
    h["article_name"] = article.name
    h["article_description"] = article.description
    h["article_unit"] = article.unit
    h
  end
end
