class OrderList < ActiveRecord::Base
  validates_numericality_of :unit_price, :quantity, greater_than: 0

  belongs_to :order
  belongs_to :article

  before_validation :set_price
  after_create :update_order_price

  private

  def set_price
    self.price = quantity.to_i * unit_price.to_f
  end

  private

  def update_order_price
    order.update_price
  end
end
