class ArticlesController < ApplicationController
  before_action :set_article_id, only: [:edit, :update, :destroy]

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    @article.user_id = current_user.id
    if @article.save
      redirect_to edit_article_path(@article)
    else
      render :new
    end
  end

  def edit
  end

  def update
    @article.update(article_params)
     if @article.save
      redirect_to edit_article_path(@article)
    end
  end

  def destroy
  end

  def index
    @articles = Article.all
  end

  def set_article_id
    @article = Article.find(params[:id])
  end

  private
   def article_params
      params.require(:article).permit(:title, :content, :is_approved, :image)
   end


end
