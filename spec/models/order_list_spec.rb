require 'spec_helper'

describe OrderList do
  context 'validations' do
    it { should belong_to :order }
    it { should belong_to :article }
    it { should validate_numericality_of(:quantity).is_greater_than(0) }
    it { should validate_numericality_of(:unit_price).is_greater_than(0) }

    it 'should call set price before save' do
      order_list = build(:order_list)
      order_list.stub(:set_price).and_return(10)
      order_list.save
      expect(order_list).to have_received(:set_price).once
      order_list.update_attributes(quantity: 999)
      expect(order_list).to have_received(:set_price).twice
    end

    it 'should have a price default value of 0' do
      order = create(:order)
      expect(order.price).to eq(0)
    end
  end

  context '#update_order_price' do
    it 'should sum the price to the order after create' do
      order = create(:order)
      expect(order.price).to eq(0)
      order_list = create(:order_list, order: order)
      expect(order.price).to eq(order_list.price)
    end

    it 'should subtract the price to the order' do

    end
  end
end
