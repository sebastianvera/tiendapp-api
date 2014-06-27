require 'spec_helper'

describe Provider do
  context 'validations' do
    it { should validate_presence_of :name }
    it { should validate_presence_of :address }
    it { should validate_presence_of :phone }
    it { should validate_presence_of :frequency }
    it { should validate_presence_of :min_order }
    it { should validate_numericality_of(:frequency).is_greater_than_or_equal_to(0) }
    it { should validate_numericality_of(:min_order).is_greater_than(0) }
    it { should have_many :catalogs }
    it { should have_many(:articles).through :catalogs }
    it { should have_many :orders }
  end
end
