require 'spec_helper'

describe Catalog do
  context 'validations' do
    it { should belong_to :article }
    it { should belong_to :provider }
    it { should validate_presence_of :price }
    it { should validate_presence_of :stock }
    it { should validate_presence_of :min_quantity }
    it { should validate_numericality_of(:price).is_greater_than(0) }
    it { should validate_numericality_of(:min_quantity).is_greater_than(0) }
    it { should validate_numericality_of(:stock).is_greater_than(0) }
  end

  describe '#can_deliver?' do
    it 'returns true if have stock and is greater or equal to the min quantity' do
      catalog = build_stubbed(:catalog, :with_stock)
      expect(catalog.can_deliver?).to be_true
    end

    it 'returns false if have stock and is below the min quantity' do
      catalog = build_stubbed(:catalog, :with_no_stock)
      expect(catalog.can_deliver?).to be_false
    end
  end
end
