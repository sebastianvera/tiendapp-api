module Api
  class InventoryController < ApiController
    def index
      render json: {inventory: Inventory.all}, status: :ok
    end
  end
end
