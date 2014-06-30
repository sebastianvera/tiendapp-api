require 'spec_helper'

describe Order do
  context 'validations' do
    it { should belong_to :provider }
    before { subject.stub(:freight_charge_changed?) { true } }

    it { should validate_numericality_of(:price).is_greater_than_or_equal_to(0) }
    it { should validate_numericality_of(:freight_charge).is_greater_than_or_equal_to(0) }
    it { should have_many :order_lists }
  end

  context '#as_json' do
    it 'should add a "total" field with the result of #total ' do
      order = build_stubbed(:order)
      expect(order.to_json).to include("total")
      expect(order.as_json["total"]).to eq(order.total)
    end
  end
  context '#total' do
    it 'should return the sum of the price and the freight_charge' do
      order = create(:order)
      expect(order.total).to eq(order.freight_charge + order.price)
    end
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

  context '#total_article_price' do
    it "should return 0 when does not have articles" do
      order = create(:order)
      expect(order.total_article_price).to eq(0)
    end

    it "should return the sum each order list's total price" do
      order = create(:order)
      order_list = create(:order_list, order: order)
      price_one = order_list.price
      expect(order.total_article_price).to eq(order_list.price)
      order_list = create(:order_list, quantity: 20, order: order)
      expect(order.total_article_price).to eq(price_one + order_list.price)
    end
  end
end
