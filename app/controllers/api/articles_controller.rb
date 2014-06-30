module Api
  class ArticlesController < ApiController
    def index
      render json: { articles: Article.all }, status: :ok
    end

    def create
      article = Article.new(article_params)
      if article.save
        render json: article, status: :created
      else
        render json: article.errors, status: :unprocessable_entity
      end
    end

    private

    def article_params
      params.require(:article).permit(:name, :description, :unit)
    end
  end
end

