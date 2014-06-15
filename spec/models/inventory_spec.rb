require 'spec_helper'

describe Inventory do
  context 'validations' do
    it { should validate_presence_of :max_quantity }
    it { should validate_presence_of :min_quantity }
    it { should validate_presence_of :stock }
    it { should validate_presence_of :daily_consume }
    it { should validate_presence_of :price }
    it { should validate_numericality_of(:stock).is_greater_than(0) }
    it { should validate_numericality_of(:price).is_greater_than(0) }
    it { should validate_numericality_of(:daily_consume).is_greater_than(0) }
  end

  context 'references' do
    it { should belong_to :article }
  end
end
