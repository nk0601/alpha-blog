class ArticlesController < ApplicationController
  before_action :set_article, only: [:edit, :update, :show, :destroy]
  
  def index
    @article_list = Article.all
  end
  
  def new
    @article = Article.new
  end
  
  def edit
  end
  
  def create
    #render plain: params[:article].inspect   #displays the params for testing
    @article = Article.new(article_params)   #call method article_params to retrieve the params[:article]
    
    if @article.save
      #show saved title and desc
      flash[:success] = "Article was successfully created"
      redirect_to article_path(@article)
    else
      # failed validation, show error then render new or create tempmlate page again
      render 'new'   # or render :new
    end  
  end
  
  def update
    if @article.update(article_params)   #need the white-listed article_params
      #show saved title and desc
      flash[:success] = "Article was successfully updated"
      redirect_to article_path(@article)
    else
      # failed validation, show error then render edit tempmlate page again
      render 'edit'   # or render :edit 
    end 
  end
  
  def show
  end
  
  def destroy
    @article.destroy
    flash[:danger] = "Article was successfully deleted"
    redirect_to articles_path
  end
  
  private
    def set_article
      @article = Article.find(params[:id])
    end
    
    def article_params
      params.require(:article).permit(:title, :description)   #require from key :article the values for :title, :description
    end
end