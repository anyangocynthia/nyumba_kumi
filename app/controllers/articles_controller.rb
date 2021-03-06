class ArticlesController < ApplicationController
  before_action :set_article, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:show, :index]
  layout 'blog', only: [:index, :show]
  layout 'dashboard', only: [:new, :edit]

  # GET /articles
  # GET /articles.json
  def index
    if params[:category]
      @articles = Article.where(category_id: Category.find_by(name: params[:category])).paginate(:page => params[:page], :per_page => 2).order('id DESC')
    elsif params[:query]
        @articles = Article.where(title: params[:query]).paginate(:page => params[:page], :per_page => 2).order('id DESC')
    # elsif params[:page]
    #   @articles = Article.all.page(params[:page], 5)
    else
      @articles = Article.all.paginate(:page => params[:page], :per_page => 2).order('id DESC')
    end
    render layout: 'blog'
  end

  # GET /articles/1
  # GET /articles/1.json
  def show
    render layout: 'blog'
  end

  # GET /articles/new
  def new
    @article = Article.new
  end

  # GET /articles/1/edit
  def edit
  end

  # POST /articles
  # POST /articles.json
  def create
    @article = Article.new(article_params)
    @article.user = current_user

    respond_to do |format|
      if @article.save
        format.html { redirect_to dashboard_blog_path, notice: 'Article was successfully created.' }
        format.json { render :show, status: :created, location: @article }
      else
        format.html { render :new }
        format.json { render json: @article.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /articles/1
  # PATCH/PUT /articles/1.json
  def update
    respond_to do |format|
      if @article.update(article_params)
        format.html { redirect_to @article, notice: 'Article was successfully updated.' }
        format.json { render :show, status: :ok, location: @article }
      else
        format.html { render :edit }
        format.json { render json: @article.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /articles/1
  # DELETE /articles/1.json
  def destroy
    @article.destroy
    respond_to do |format|
      format.html { redirect_to articles_url, notice: 'Article was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def delete_multiple
    deleted = 0
    params[:delete_articles].split(',').each do |id|
      Article.find_by(id: id).destroy
      deleted = deleted + 1
    end
    redirect_to dashboard_blog_path, notice: "You have deleted #{deleted} articles."
  end

  def add_category
    Category.create! name: params[:name]
    redirect_to dashboard_blog_path
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_article
      @article = Article.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def article_params
      params.require(:article).permit(:title, :body, :slug, :category_id, :published, :feature_image)
    end
end
