class ArticlesController < ApplicationController
  def new
    @article = Article.new
  end
  
  def create
    #render plain: params[:article].inspect   #displays the params for testing
    
    @article = Article.new(article_params)   #call method article_params to retrieve the params[:article]
    @article.save
    redirect_to articles_show(@article)
  end
  
  private
    def article_params
      params.require(:article).permit(:title, :description)   #require from key :article the values for :title, :description
    end
end