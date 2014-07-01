require 'spec_helper'

describe 'GET /api/inventory/' do
  it 'return all the articles in the inventory' do
    get 'api/inventory'
    expect(response_json).to eq(inventory: [])
    expect(response.status).to eq 200

    inventory = create(:inventory)
    get 'api/inventory'

    expect(response_json).to eq(inventory: [model_to_json(inventory)])
    expect(response.status).to eq 200
  end
end
