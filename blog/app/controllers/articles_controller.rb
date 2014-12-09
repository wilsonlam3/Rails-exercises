class ArticlesController < ApplicationController
  def new
    @article = Article.new
  end

  def create
  	@article = Article.new(article_params)
    if @article.save
      flash[:notice] = "Article successfully created!"
      redirect_to @article
    else
      flash[:error] = "There was a problem saving your article"
      render 'new'
    end
  end

  def index
    @current_time = Time.now
    @articles = Article.all
  end

  def show
    @article = Article.find(params[:id])
  end

  def edit
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])
 
    if @article.update(article_params)
      redirect_to @article
    else
      render 'edit'
    end
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy
 
    redirect_to articles_path
  end

  
  private
    def article_params
    	params.require(:article).permit(:title, :text)
    end
end
