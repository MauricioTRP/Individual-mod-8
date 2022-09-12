class ArticlesController < ApplicationController
  def index
    @articles = Article.all
  end

  def show
    @article = Article.find(params[:id])
  end

  def new
    @article = Article.new
  end

  def create
    @arcticle = Article.new(article_params)
    if @arcticle.save
      flash[:success] = "Article creado con éxito"
      redirect_to @arcticle
    else
      flash[:error] = "Algo salió mal =("
      render 'new'
    end
  end

  private

  def article_params
    params.require(:article).permit(:title, :content)
  end
end
