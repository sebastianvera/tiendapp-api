class Provider < ActiveRecord::Base
  validates_presence_of :name, :address, :frequency, :phone, :min_order
  validates_numericality_of :min_order, greater_than: 0
  validates_numericality_of :frequency, greater_than_or_equal_to: 0

  has_many :catalogs
  has_many :articles, through: :catalogs
  has_many :orders
end
