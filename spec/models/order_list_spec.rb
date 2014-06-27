require 'spec_helper'

describe OrderList do
  context 'validations' do
    it { should belong_to :order }
    it { should belong_to :article }
    it { should validate_numericality_of(:quantity).is_greater_than(0) }
    it { should validate_numericality_of(:unit_price).is_greater_than(0) }
    it { should validate_numericality_of(:price).is_greater_than(0) }
  end
end
