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

  context '#as_json' do
    it "should append the article's name" do
      inventory = build_stubbed(:inventory)
      expect(inventory.as_json).to include("article_name")
    end

    it "should append the article's description" do
      inventory = build_stubbed(:inventory)
      expect(inventory.as_json).to include("article_description")
    end

    it "should append the article's unit" do
      inventory = build_stubbed(:inventory)
      expect(inventory.as_json).to include("article_unit")
    end
  end
end
