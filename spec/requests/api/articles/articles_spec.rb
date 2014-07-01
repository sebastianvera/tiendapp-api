require 'spec_helper'

# describe 'GET /api/articles' do
#   it 'return all the articles ' do
#     get 'api/articles'
#     expect(response_json).to eq([])
#     expect(response.status).to eq 200
#
#     article = create(:article)
#     get 'api/articles'
#
#     expect(response_json).to eq([model_to_json(article)])
#     expect(response.status).to eq 200
#   end
# end

describe 'POST /api/articles' do
  it 'return article when created' do
    attributes = { name: 'name', description: 'description', unit: 'kg' }
    post 'api/articles',
      attributes.to_json,
      { 'Accept' => Mime::JSON, 'Content-Type' => Mime::JSON.to_s }

    expect(response.status).to eq 201
    expect(response_json).to include(attributes)
  end
end

describe 'PUT /api/articles/:id/'  do
  it 'save an article' do
    article = create(:article)
    new_name = "new #{article.name}"
    article.name = new_name
    attributes = article.to_json(only: [:name, :description, :unit])
    put api_article_path(article),
      attributes,
      { 'Accept' => Mime::JSON, 'Content-Type' => Mime::JSON.to_s }

    expect(response.status).to eq 200
    expect(article.reload.name).to eq(new_name)
  end
end
