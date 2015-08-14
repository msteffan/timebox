class ArticlesController < ApplicationController

######## CRUD ROUTES  ########
# Don't call them names! They're very sensitive.
#index
    def index
        if params[:query] != nil
            @guardian_article = GuardianArticle.new(params[:query])
        end
        @articles = Article.all
        # Could save some text by making a custom current_user method in your ApplicationController
        @user = User.find(session[:user]["id"])
    end

#show
    def show
        @article = Article.find(params[:id])
        @user = User.find(session[:user]["id"])
        @likes = @article.likes
    end

end
