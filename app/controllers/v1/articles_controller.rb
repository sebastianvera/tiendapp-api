module V1
  class ArticlesController < ApiController
    def index
      render json: Article.all, status: :ok
    end
  end
end

