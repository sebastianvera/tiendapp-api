class Order < ActiveRecord::Base
  validates_numericality_of :freight_charge, greater_than_or_equal_to: 0
  validates_numericality_of :price, :total, greater_than: 0
  belongs_to :provider
end
