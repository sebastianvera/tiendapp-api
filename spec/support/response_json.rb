module ResponseJSON
  def response_json
    JSON.parse(response.body, symbolize_names: true)
  end

  def model_to_json(model)
    JSON.parse(model.to_json, symbolize_names: true)
  end
end

RSpec.configure do |config|
  config.include ResponseJSON
end
