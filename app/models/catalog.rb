class Catalog < ActiveRecord::Base
  validates_presence_of :stock, :min_quantity, :price
  validates_numericality_of :stock, :min_quantity, :price, greater_than: 0
  belongs_to :provider
  belongs_to :article

  delegate :min_order, to: :provider, prefix: true, allow_nill: false

  def can_deliver?
    stock >= min_quantity
  end
end
