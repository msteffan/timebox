module ApplicationHelper
    # attr_reader :article_length

    # controls whether or not an article gets a most-read class
    def most_read?(article)
        numLikes = Like.all.count.to_f
        articleLikes = article.likes.count.to_f
        percentLikes = articleLikes / numLikes
        if  percentLikes > 0.1
            most_read_class = "mostRead"
        end
        return most_read_class
    end

    # manages length class assigned to Guardian articles
    # This method is included in the Article model. How could you DRY it up?
    def ext_length_class(result)
        article_length = sanitize(result['fields']['body'], :tags=>[]).split(" ").length
        if article_length <= 400
            html_class = "twoMinutes"
        elsif article_length <= 800
            html_class = "fourMinutes"
        elsif article_length <= 1200
            html_class = "sixMinutes"
        elsif article_length > 1201
           html_class = "tenMinutes"
        end

        return html_class
    end

end
