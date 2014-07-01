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

  describe '#economic_provider' do
    it 'returns the most economic provider' do
      provider = create(:provider)
      article = create(:article, :with_economic_provider)
      # Add an expensive catalog provider
      create(:catalog, price: 999_999, provider: provider, article: article)
      expect(article.economic_provider.id).not_to eq(provider.id)
    end
  end
end
