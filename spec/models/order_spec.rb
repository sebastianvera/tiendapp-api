require 'spec_helper'

describe Order do
  context 'validations' do
    it { should belong_to :provider }
    it { should validate_numericality_of(:price).is_greater_than(0) }
    it { should validate_numericality_of(:freight_charge).is_greater_than_or_equal_to(0) }
    it { should validate_numericality_of(:total).is_greater_than(0) }
  end
end
