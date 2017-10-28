class ArticlesController < ApplicationController
  def new
    @article = Article.new
  end
  
  def create
    #render plain: params[:article].inspect   #displays the params for testing
    @article = Article.new(article_params)   #call method article_params to retrieve the params[:article]
    
    if @article.save
      #show saved title and desc
      flash[:notice] = "Article was successfully created"
      redirect_to article_path(@article)
    else
      # failed validation, show error then render new or create tempmlate page again
      render 'new'   # or render :new
    end
  end
  
  def show
    @article = Article.find(params[:id])
  end
  
  private
    def article_params
      params.require(:article).permit(:title, :description)   #require from key :article the values for :title, :description
    end
end