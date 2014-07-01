require 'spec_helper'

describe 'GET /api/providers' do
  it 'return all the articles ' do
    get 'api/providers'
    expect(response_json).to eq(providers: [])
    expect(response.status).to eq 200

    provider = create(:provider)
    get 'api/providers'

    expect(response_json).to eq(providers: [model_to_json(provider)])
    expect(response.status).to eq 200
  end
end
