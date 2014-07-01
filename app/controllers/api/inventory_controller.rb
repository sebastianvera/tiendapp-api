module Api
  class InventoryController < ApiController
    def index
      render json: Inventory.all, status: :ok
    end
  end
end
