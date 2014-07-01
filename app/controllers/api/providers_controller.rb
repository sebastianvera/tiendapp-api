class Api::ProvidersController < ApiController
  def index
    render json: { providers: Provider.all }, status: :ok
  end
end
