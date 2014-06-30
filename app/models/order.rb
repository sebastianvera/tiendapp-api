class Order < ActiveRecord::Base
  # validates_numericality_of :freight_charge, :price, greater_than_or_equal_to: 0
  validates_numericality_of :freight_charge, greater_than_or_equal_to: 0, if: :freight_charge_changed?
  validates_numericality_of :price, greater_than_or_equal_to: 0, if: :freight_charge_changed?

  belongs_to :provider
  has_many :order_lists

  delegate :min_order, :to => :provider, :prefix => true, :allow_nil => false

  def can_deliver?
    total_articles >= provider_min_order
  end

  def total_articles
    order_lists.sum(:quantity)
  end

  def total_article_price
    order_lists.sum(:price)
  end

  def total
    freight_charge + price
  end

  def as_json(options = {})
    h = super(options.to_h)
    h["total"] = total
    h
  end

  def update_price
    update_attributes(price: total_article_price)
  end
end
