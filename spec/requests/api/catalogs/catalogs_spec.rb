require 'spec_helper'

describe 'GET /api/providers/:provider_id/items' do
  it "returns the provider's items" do
    provider = create(:catalog).provider
    create(:catalog, provider: provider)
    catalogs = provider.catalogs
    get "api/providers/#{provider.id}/items"
    expect(response.status).to eq 200
    expect(response_json).to eq(items: model_to_json(catalogs))
  end
end
