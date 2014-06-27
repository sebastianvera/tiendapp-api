class Order < ActiveRecord::Base
  validates_numericality_of :freight_charge, greater_than_or_equal_to: 0
  validates_numericality_of :price, :total, greater_than: 0

  belongs_to :provider
  has_many :order_lists

  #TODO: Why do we need the price?
  delegate :min_order, :to => :provider, :prefix => true, :allow_nil => false

  def can_deliver?
    total_articles >= provider_min_order
  end

  def total_articles
    order_lists.sum(:quantity)
  end
end
