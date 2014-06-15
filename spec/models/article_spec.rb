require 'spec_helper'

describe Article do
  context 'validations' do
    it { should validate_presence_of :name }
    it { should validate_presence_of :description }
    it { should validate_presence_of :unit }
    it { should have_many :catalogs }
    it { should have_many(:providers).through :catalogs }
  end

  describe '#avalaible_providers' do
    it 'returns empty if there are no providers' do
      article = create(:article)
      create(:catalog, :with_no_stock, article: article)
      expect(article.available_providers).to have(0).item
    end
    it 'returns providers with stock above min quantity' do
      article = create(:article)
      create(:catalog, :limited_by_quantity, article: article)
      expect(article.available_providers).to have(0).item
    end
    it 'returns providers with stock' do
      article = create(:article)
      create(:catalog, :with_stock, article: article)
      expect(article.available_providers).to have(1).item
    end
  end
end
