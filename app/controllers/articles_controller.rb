class ArticlesController < ApplicationController

    def show
        @article = Article.find(params[:id])
    end

    def index
        @articles = Article.all
    end

    def new
    @article = Article.new
    end

    def create
      @article = Article.new(params.require(:article).permit(:title, :description))
      @article.save
      # redirect_to @article
       if @article.save
      flash[:notice] = "Article was created successfully."
      redirect_to @article
       else
    # Redirect to the new action to display the form with errors
        redirect_to new_article_path, alert: @article.errors.full_messages.join(', ')
       end

    end

end
