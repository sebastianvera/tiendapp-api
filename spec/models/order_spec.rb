require 'spec_helper'

describe Order do
  context 'validations' do
    it { should belong_to :provider }
    it { should validate_numericality_of(:price).is_greater_than(0) }
    it { should validate_numericality_of(:freight_charge).is_greater_than_or_equal_to(0) }
    it { should validate_numericality_of(:total).is_greater_than(0) }
    it { should have_many :order_lists }
  end

  context '#can_deliver?' do
    it "should return false if the articles count is less than the provider min order" do
      order = create(:order)
      order.stub(:total_articles).and_return(order.provider_min_order - 1)
      expect(order.can_deliver?).to be_false
    end

    it "should return true if the article's count is greater or equal to the provider's min order" do
      order = create(:order)
      order.stub(:total_articles).and_return(order.provider_min_order)
      expect(order.can_deliver?).to be_true
    end
  end

  context '#total_price' do
    it "should return the sum each order list's total price" do
      pending
    end
  end
end
