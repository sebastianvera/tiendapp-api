require 'spec_helper'

describe 'GET /V1/articles' do
  it 'return all the articles ' do
    get 'http://api.example.com/v1/articles'
    expect(response_json).to eq([])
    expect(response.status).to eq 200

    article = create(:article)

    get 'http://api.example.com/v1/articles'
    expect(response_json).to eq([model_to_json(article)])
    expect(response.status).to eq 200
  end
end

def model_to_json(model)
  JSON.parse(model.to_json)
end

