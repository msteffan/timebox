require 'httparty'
# Great use of a custom model
class GuardianArticle
    API_URL = 'http://content.guardianapis.com'
    attr_reader :response, :results, :length


    def initialize (query)
        @response = HTTParty.get('http://content.guardianapis.com/search?show-fields=body%2Cbyline%2Cheadline&q=' + query + '&api-key=test')
    end

    def results
        @results = response['response']['results']
    end


end
