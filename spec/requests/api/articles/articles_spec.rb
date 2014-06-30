require 'spec_helper'

describe 'GET /api/articles' do
  it 'return all the articles ' do
    get 'api/articles'
    expect(response_json).to eq([])
    expect(response.status).to eq 200

    article = create(:article)

    get 'api/articles'
    expect(response_json).to eq([model_to_json(article)])
    expect(response.status).to eq 200
  end
end

def model_to_json(model)
  JSON.parse(model.to_json)
end

