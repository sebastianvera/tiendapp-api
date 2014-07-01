class Api::CatalogsController < ApiController
  def index
    render json: { items: Provider.find(params[:provider_id]).catalogs },
      status: :ok
  end
end
