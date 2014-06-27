class OrderList < ActiveRecord::Base
  validates_numericality_of :unit_price, :quantity, :price,  greater_than: 0

  belongs_to :order
  belongs_to :article
end
