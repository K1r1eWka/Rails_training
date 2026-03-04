class ArticlesController < ApplicationController
  # перед действиями show, edit, update, destroy будет вызван метод set_article внутри первым методом
  before_action :set_article, only: [ :show, :edit, :update, :destroy ]

  def index
    @articles = Article.paginate(page: params[:page], per_page: 5)
  end

  def show
  end

  def update
    if @article.update(article_params)
      flash[:notice] = "Article was successfully updated."
      redirect_to @article
    else
      # необрабатываемый объект - unprocessable_entity
      render :edit, status: :unprocessable_entity
    end
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    @article.user = User.first
    if @article.save
      flash[:notice] = "Article was successfully created."
      redirect_to @article
    else
      # необрабатываемый объект - unprocessable_entity
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def destroy
    @article.destroy
    flash[:notice] = "Article was successfully deleted."
    redirect_to articles_path
  end

  # Все что ниже приват принадлежит только контроллеру то есть классу, тольок внутри класса можно вызвать его
  private

  def set_article
    @article = Article.find(params[:id])
  end

  def article_params
    params.require(:article).permit(:title, :description)
  end
end
