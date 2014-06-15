class Article < ActiveRecord::Base
  validates_presence_of :name, :description, :unit

  has_many :catalogs
  has_many :providers, through: :catalogs

  def available_providers
    available = []
    catalogs.includes(:provider).find_each do |catalog|
      if catalog.can_deliver?
        available.push(catalog.provider)
      end
    end

    available
  end
end
