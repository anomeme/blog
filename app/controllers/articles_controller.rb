class ArticlesController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :find_article, only: [:show, :edit, :update, :destroy]

  def index
    @articles = Article.order(created_at: :DESC).page(params[:page]).per(9)
  end

  def show
  end

  def new
    @article = Article.new
  end

  def edit
  end

  def create
    @article = Article.new(article_params)
    @article.user_id = current_user.id
    if @article.save
      redirect_to @article, notice: "作成完了"
    else
      render :new, alert: "作成に失敗しました"
    end
  end

  def update
    if @article.update(article_params)
      redirect_to @article, notice: "更新完了"
    else
      render :edit, alert: "更新に失敗しました"
    end
  end

  def destroy
    @article.destroy
    redirect_to root_path, notice: "削除完了"
  end

  private

  def find_article
    @article = Article.find(params[:id])
  end

  def article_params
    params.require(:article).permit(:title, :text, :image)
  end

end
