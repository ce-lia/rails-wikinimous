class ArticlesController < ApplicationController
  def index
    @article = Article.all
  end

  def show
    @article = Article.find(params[:id])
  end

  def create
    @article = Article.new(restaurant_params)
    @article.save

    redirect_to article(@article)
  end

  def update
    @article = Article.find(params[:id])
    @article.update(restaurant_params)

    redirect_to article_path(@article)
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy

    redirect_to articles_path
  end

  private

  def article_params
    params.require(:article).permit(:title, :content)
  end
end
