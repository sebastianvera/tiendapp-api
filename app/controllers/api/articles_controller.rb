module Api
  class ArticlesController < ApiController
    def index
      render json: Article.all, status: :ok
    end
  end
end

