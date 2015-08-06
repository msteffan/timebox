class ArticlesController < ApplicationController

######## CRUD ROUTES  ########

#index
    def index
        if params[:query] != nil
            @guardian_article = GuardianArticle.new(params[:query])
        end
        @articles = Article.all
        @user = User.find(session[:user]["id"])
    end

    def show
        @article = Article.find(params[:id])
        @user = User.find(session[:user]["id"])
        @likes = @article.likes
    end


    private
    def article_params
        params.require(:article).permit(:title, :author, :publication, :fulltext, :length)
    end

end
